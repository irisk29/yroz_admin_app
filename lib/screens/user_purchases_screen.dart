import 'package:flutter/material.dart';
import 'package:yroz_admin/DTO/purchase.dart';
import 'package:yroz_admin/DataLayer/admin_metrics.dart';
import 'package:yroz_admin/widget/purchase_item.dart';

class UserPurchasesScreen extends StatefulWidget {
  static const routeName = '/user-purchases';

  @override
  _UserPurchasesScreenState createState() => _UserPurchasesScreenState();
}

class _UserPurchasesScreenState extends State<UserPurchasesScreen> {
  late Future<List<Purchase>> _purchasesFuture;
  late String userID;

  @override
  void didChangeDependencies() {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    userID = routeArgs['userID'] as String;
    _purchasesFuture = _initPurchases();
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  Future<List<Purchase>> _initPurchases() async {
    final purchases = await AdminMetrics().getSuccessfulPurchaseHistoryForUserInLastMonth(userID);
    return purchases;
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: deviceSize.height * 0.1,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Purchases In The Last Month",
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: _purchasesFuture,
        builder: (BuildContext context, AsyncSnapshot<List<Purchase>> snap) {
          return snap.connectionState != ConnectionState.done
              ? Center(child: CircularProgressIndicator())
              : snap.data != null && snap.data!.length > 0
                  ? Padding(
                      padding: EdgeInsets.only(top: deviceSize.height * 0.01),
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: snap.data!.length,
                          itemBuilder: (context, index) => HistoryPurchaseItem(
                              snap.data![index],
                              snap.data![index].storeName == null
                                  ? "The store does not exist"
                                  : snap.data![index].storeName!)),
                    )
                  : Container(
                      width: deviceSize.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: deviceSize.width * 0.11,
                            backgroundColor: Theme.of(context).primaryColor,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(Icons.history, size: 40),
                              radius: deviceSize.width * 0.1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(deviceSize.height * 0.01),
                            child: Text("Purchases In The Last Month",
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                          Text("No Purchases were made yet"),
                        ],
                      ),
                    );
        },
      ),
    );
  }
}
