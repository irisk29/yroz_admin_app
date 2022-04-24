import 'package:flutter/material.dart';
import 'package:yroz_admin/DTO/store.dart';
import 'package:yroz_admin/DataLayer/admin_metrics.dart';
import 'package:yroz_admin/screens/store_purchases_screen.dart';

class StoresScreen extends StatefulWidget {
  static const routeName = '/stores';

  @override
  State<StoresScreen> createState() => _StoresScreenState();
}

class _StoresScreenState extends State<StoresScreen> {
  List<Store> stores = [];

  GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  Future<void> _pullRefresh() async {
    setState(() {});
  }

  Future<void> fetchUsers() async {
    stores = await AdminMetrics().fetchStores();
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return FutureBuilder(
        future: fetchUsers(),
        builder: (BuildContext context, AsyncSnapshot snap) {
          return snap.connectionState != ConnectionState.done
              ? Center(child: CircularProgressIndicator())
              : stores.isEmpty
                  ? Center(child: Text("NO STORES WERE OPEN!"))
                  : SafeArea(
                      child: RefreshIndicator(
                      key: _refreshIndicatorKey,
                      onRefresh: _pullRefresh,
                      child: ListView.builder(
                        itemBuilder: (ctx, index) {
                          return Column(
                            children: [
                              Card(
                                elevation: 5,
                                margin: EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 5,
                                ),
                                child: ListTile(
                                    leading: CircleAvatar(
                                      radius: 25,
                                      child: Padding(
                                        padding: EdgeInsets.all(6),
                                        child: FittedBox(
                                          child: Icon(Icons.store),
                                        ),
                                      ),
                                    ),
                                    title: stores[index].isOnline
                                        ? Text(
                                            "Online store: ${stores[index].storeName}")
                                        : Text(
                                            "Physical store: ${stores[index].storeName}"),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(stores[index].address),
                                        Text(stores[index].phoneNumber),
                                      ],
                                    ),
                                    isThreeLine: true,
                                    trailing: IconButton(
                                      icon: Icon(Icons.remove_red_eye_outlined),
                                      color: Theme.of(context).primaryColor,
                                      onPressed: () => Navigator.of(context)
                                          .pushNamed(
                                              StorePurchasesScreen.routeName,
                                              arguments: {
                                            "storeID": stores[index].storeID,
                                            "storeName": stores[index].storeName
                                          }),
                                    )),
                              ),
                            ],
                          );
                        },
                        itemCount: stores.length,
                      ),
                    ));
        });
  }
}
