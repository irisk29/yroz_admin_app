import 'dart:convert';

import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:f_logs/model/flog/flog.dart';
import 'package:yroz_admin/DTO/product.dart';
import 'package:yroz_admin/DTO/purchase.dart';
import 'package:yroz_admin/DTO/store.dart';
import 'package:yroz_admin/DTO/user.dart';
import 'package:yroz_admin/InternalPaymentGateway/InternalPaymentGateway.dart';
import 'package:yroz_admin/models/ModelProvider.dart';
import 'package:yroz_admin/result/Failure.dart';
import 'package:yroz_admin/result/OK.dart';
import 'package:yroz_admin/result/ResultInterface.dart';

class AdminMetrics {
  static final AdminMetrics _singleton = AdminMetrics._internal();

  factory AdminMetrics() {
    return _singleton;
  }

  AdminMetrics._internal();

  int _numOfRegisteredUsers = 0;
  int _numOfPhysicalStores = 0;
  int _numOfOnlineStores = 0;

  int get numOfPhysicalStores => _numOfPhysicalStores;
  int get numOfRegisteredUsers => _numOfRegisteredUsers;
  int get numOfOnlineStores => _numOfOnlineStores;

  void createRegisteredUsersSubscription() {
    Stream<QuerySnapshot<UserModel>> stream =
    Amplify.DataStore.observeQuery(UserModel.classType);

    stream.listen((QuerySnapshot<UserModel> snapshot) {
      this._numOfRegisteredUsers = snapshot.items.length;
      FLog.info(text: "Number of registered users is $_numOfRegisteredUsers");
    });
  }

  void createPhysicalStoresAmountSubscription() {
    Stream<QuerySnapshot<PhysicalStoreModel>> stream =
    Amplify.DataStore.observeQuery(PhysicalStoreModel.classType);

    stream.listen((QuerySnapshot<PhysicalStoreModel> snapshot) {
      this._numOfPhysicalStores = snapshot.items.length;
      FLog.info(text: "Number of physical stores is $_numOfPhysicalStores");
    });
  }

  void createOnlineStoresAmountSubscription() {
    Stream<QuerySnapshot<OnlineStoreModel>> stream =
    Amplify.DataStore.observeQuery(OnlineStoreModel.classType);

    stream.listen((QuerySnapshot<OnlineStoreModel> snapshot) {
      this._numOfOnlineStores = snapshot.items.length;
      FLog.info(text: "Number of online stores is $_numOfOnlineStores");
    });
  }

  Future<List<User>> fetchUsers() async
  {
    List<UserModel> userModels = await Amplify.DataStore.query(UserModel.classType);
    List<User> users = [];

    for(UserModel model in userModels)
    {
      try {
        ResultInterface<String> cashBackAmountRes = await InternalPaymentGateway().eWalletBalance(model.id, model.eWallet!);
        if(cashBackAmountRes.getTag() && cashBackAmountRes.getValue() != null)
        {
          double cashBack = double.parse(cashBackAmountRes.getValue()!);
          User user = User(model.id, model.name, model.email, cashBack, model.imageUrl!);
          users.add(user);
        }
      } on Exception catch (e) {
        FLog.error(text: e.toString(), stacktrace: StackTrace.current);
      }
    }
    return users;
  }

  Future<PhysicalStoreModel?> _fetchPhysicalStore(
      String? storeOwnerPhysicalStoreId) async {
    if (storeOwnerPhysicalStoreId == null) return null;
    List<PhysicalStoreModel> physicalStores = await Amplify.DataStore.query(
        PhysicalStoreModel.classType,
        where: PhysicalStoreModel.ID.eq(storeOwnerPhysicalStoreId));

    if (physicalStores.isEmpty) return null;
    return physicalStores.first; //only one physical store per user
  }

  Future<OnlineStoreModel?> _fetchOnlineStore(
      String? storeOwnerOnlineStoreId) async {
    if (storeOwnerOnlineStoreId == null) return null;
    List<OnlineStoreModel> onlineStores = await Amplify.DataStore.query(
        OnlineStoreModel.classType,
        where: OnlineStoreModel.ID.eq(storeOwnerOnlineStoreId));
    if (onlineStores.isEmpty) return null;
    var onlinestore = onlineStores.first;
    List<StoreProductModel> products = await Amplify.DataStore.query(
        StoreProductModel.classType,
        where: StoreProductModel.ONLINESTOREMODELID.eq(onlinestore.id));

    var fullStore = onlinestore.copyWith(storeProductModels: products);
    return fullStore; //only one online store per user
  }

  Future<ResultInterface> _getStoreNameByID(String storeID) async {
    var phy = await _fetchPhysicalStore(storeID);
    if (phy == null) {
      var online = await _fetchOnlineStore(storeID);
      if (online == null) {
        FLog.error(text: "No such store $storeID");
        return new Failure("The store $storeID does not exist");
      }
      return new Ok("Found store $storeID name", online.name);
    }
    return new Ok("Found store $storeID name", phy.name);
  }

  Future<List<Purchase>> getSuccessfulPurchaseHistoryForUserInLastMonth(
      String userID) async {
    try {
      FLog.info(text: "store id is: $userID");
      DateTime now = DateTime.now();
      DateTime monthAgo = DateTime(now.year, now.month - 1, now.day);
      var res = await InternalPaymentGateway()
          .getPurchaseHistory(monthAgo, now, userId: userID, succeeded: true);
      if (!res.getTag()) {
        print(res.getMessage());
        return [];
      }
      FLog.info(text: "res value is: ${res.getValue()}");
      List<Map<String, Object>> purchases = res.getValue()!;
      var purchasesDTO =
      purchases.map((e) => Purchase.fromJson(e)).toList();
      for(var p in purchasesDTO)
      {
        var res = await _getStoreNameByID(p.storeID);
        if(res.getTag())
        {
          p.storeName = res.getValue();
        }
      }
      return purchasesDTO;
    } on Exception catch (e) {
      FLog.error(text: e.toString(), stacktrace: StackTrace.current);
      return [];
    }
  }

  Future<ResultInterface<List<Product>>> getPurchaseProduct(
      String transactionID) async {
    List<PurchaseHistoryModel> purchases = await Amplify.DataStore.query(
        PurchaseHistoryModel.classType,
        where: PurchaseHistoryModel.TRANSACTIONID.eq(transactionID));

    if (purchases.isEmpty) {
      FLog.error(
          text: "No Purchases were found for transaction $transactionID");
    }
    PurchaseHistoryModel purchase = purchases.first; //transaction ID is unique
    if (purchase.products == null || purchase.products!.isEmpty)
      return new Ok("No products for purchase", []);
    var purchaseProducts = jsonDecode(purchase.products!) as List<dynamic>;
    var convertedPurchaseProducts = purchaseProducts
        .map((e) => Product.fromJson(e as Map<String, dynamic>))
        .toList();
    return new Ok("Found products for purchase $transactionID",
        convertedPurchaseProducts);
  }

  Future<List<Store>> fetchStores() async
  {
    List<OnlineStoreModel> onlineModels = await Amplify.DataStore.query(OnlineStoreModel.classType);
    List<PhysicalStoreModel> physicalModels = await Amplify.DataStore.query(PhysicalStoreModel.classType);
    List<Store> stores = [];

    for(OnlineStoreModel model in onlineModels)
    {
      try {
        Store store = Store(model.id, model.name, model.address, model.phoneNumber, true);
        stores.add(store);
      } on Exception catch (e) {
        FLog.error(text: e.toString(), stacktrace: StackTrace.current);
      }
    }

    for(PhysicalStoreModel model in physicalModels)
    {
      try {
        Store store = Store(model.id, model.name, model.address, model.phoneNumber, false);
        stores.add(store);
      } on Exception catch (e) {
        FLog.error(text: e.toString(), stacktrace: StackTrace.current);
      }
    }
    return stores;
  }

  Future<List<Purchase>> getSuccessfulPurchaseHistoryForStoreInLastMonth(
      String storeID) async {
    try {
      FLog.info(text: "store id is: $storeID");
      DateTime now = DateTime.now();
      DateTime monthAgo = DateTime(now.year, now.month - 1, now.day);
      var res = await InternalPaymentGateway()
          .getPurchaseHistory(monthAgo, now, storeId: storeID, succeeded: true);
      if (!res.getTag()) {
        print(res.getMessage());
        return [];
      }
      FLog.info(text: "res value is: ${res.getValue()}");
      List<Map<String, Object>> purchases = res.getValue()!;
      var purchasesDTO =
      purchases.map((e) => Purchase.fromJson(e)).toList();
      return purchasesDTO;
    } on Exception catch (e) {
      FLog.error(text: e.toString(), stacktrace: StackTrace.current);
      return [];
    }
  }
}