import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:f_logs/model/flog/flog.dart';
import 'package:yroz_admin/models/ModelProvider.dart';

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
      FLog.info(text: "Number of physical stores is $_numOfOnlineStores");
    });
  }


}