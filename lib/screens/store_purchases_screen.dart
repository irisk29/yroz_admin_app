import 'package:flutter/material.dart';
import 'package:yroz_admin/DTO/purchase.dart';
import 'package:yroz_admin/DataLayer/admin_metrics.dart';
import 'package:yroz_admin/widget/purchase_item.dart';

class StorePurchasesScreen extends StatefulWidget {
  static const routeName = '/store-purchases';

  @override
  _StorePurchasesScreenState createState() => _StorePurchasesScreenState();
}

class _StorePurchasesScreenState extends State<StorePurchasesScreen> {
  late String storeName;
  late String storeID;
  late List<Purchase> storePurchases;

  late Future<void> _purchasesFuture;
  GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    storeName = routeArgs['storeName'] as String;
    storeID = routeArgs['storeID'] as String;
    _purchasesFuture = _initPurchases();
    super.didChangeDependencies();
  }

  Future<void> _initPurchases() async {
    storePurchases = await AdminMetrics()
        .getSuccessfulPurchaseHistoryForStoreInLastMonth(storeID);
  }

  Future<void> _pullRefresh() async {
    final storePurchasesTemp = await AdminMetrics()
        .getSuccessfulPurchaseHistoryForStoreInLastMonth(storeID);
    setState(() {
      storePurchases = storePurchasesTemp;
    });
  }

  double totalStoreEarning() {
    final double totalEarning = storePurchases.fold(
        0, (sum, item) => sum + item.cashBackAmount + item.creditAmount);
    return totalEarning;
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
        builder: (BuildContext context, AsyncSnapshot snap) {
          return snap.connectionState != ConnectionState.done
              ? Center(child: CircularProgressIndicator())
              : RefreshIndicator(
                  key: _refreshIndicatorKey,
                  onRefresh: _pullRefresh,
                  child: storePurchases.length > 0
                      ? Column(
                          children: [
                            Container(
                              height: deviceSize.height * 0.1,
                              width: double.infinity,
                              color: Colors.white,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                    "Total Earnings",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                      Text(
                                        "  \€" +
                                            totalStoreEarning()
                                                .toStringAsFixed(2),
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: storePurchases.length,
                                itemBuilder: (context, index) {
                                  return Column(children: [
                                    ListTile(title: Text("New")),
                                    HistoryPurchaseItem(
                                        storePurchases[index], storeName)
                                  ]);
                                },
                              ),
                            ),
                          ],
                        )
                      : Container(
                          width: MediaQuery.of(context).size.width,
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
                                padding:
                                    EdgeInsets.all(deviceSize.height * 0.01),
                                child: Text("Purchases In The Last Month",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Text(
                                  "We are Sorry, no purchases were made in your store yet"),
                            ],
                          ),
                        ),
                );
        },
      ),
    );
  }
}
