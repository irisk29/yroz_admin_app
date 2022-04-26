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
  TextEditingController editingController = TextEditingController();
  List<Store> stores = [];
  List<Store> changeableStores = [];

  late Future<void> _future;
  GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    _future = fetchStores();
  }

  Future<void> _pullRefresh() async {
    List<Store> storesTmp = await AdminMetrics().fetchStores();
    setState(() {
      stores = storesTmp;
      changeableStores.clear();
      changeableStores.addAll(stores);
    });
  }

  Future<void> fetchStores() async {
    stores = await AdminMetrics().fetchStores();
    changeableStores.addAll(stores);
  }

  void filterSearchResults(String query) {
    List<Store> dummySearchList = [];
    dummySearchList.addAll(stores);
    if (query.isNotEmpty) {
      List<Store> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.storeName.toLowerCase().contains(query.toLowerCase()) ||
            item.address.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        changeableStores.clear();
        changeableStores.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        changeableStores.clear();
        changeableStores.addAll(stores);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return FutureBuilder(
        future: _future,
        builder: (BuildContext context, AsyncSnapshot snap) {
          return snap.connectionState != ConnectionState.done
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: RefreshIndicator(
                    key: _refreshIndicatorKey,
                    onRefresh: _pullRefresh,
                    child: Column(
                      children: [
                        Container(
                          height: deviceSize.height * 0.09,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              onChanged: (value) {
                                filterSearchResults(value);
                              },
                              controller: editingController,
                              decoration: InputDecoration(
                                  labelText: "Search",
                                  hintText: "Search",
                                  prefixIcon: Icon(Icons.search),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25.0)))),
                            ),
                          ),
                        ),
                        changeableStores.isEmpty
                            ? Container(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.30),
                                child: Center(child: Text("NO STORES!")))
                            : Container(
                                height: deviceSize.height * 0.685,
                                child: ListView.builder(
                                  itemBuilder: (ctx, index) {
                                    return Card(
                                      color: changeableStores[index].isOnline
                                          ? Colors.white
                                          : Color.fromRGBO(244, 244, 244, 50),
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
                                          title: changeableStores[index]
                                                  .isOnline
                                              ? Text(
                                                  "Online: ${changeableStores[index].storeName}")
                                              : Text(
                                                  "Physical: ${changeableStores[index].storeName}"),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(changeableStores[index]
                                                  .address),
                                              Text(changeableStores[index]
                                                  .phoneNumber),
                                            ],
                                          ),
                                          isThreeLine: true,
                                          trailing: IconButton(
                                            icon: Icon(
                                                Icons.remove_red_eye_outlined),
                                            color:
                                                Theme.of(context).primaryColor,
                                            onPressed: () =>
                                                Navigator.of(context).pushNamed(
                                                    StorePurchasesScreen
                                                        .routeName,
                                                    arguments: {
                                                  "storeID":
                                                      changeableStores[index]
                                                          .storeID,
                                                  "storeName":
                                                      changeableStores[index]
                                                          .storeName
                                                }),
                                          )),
                                    );
                                  },
                                  itemCount: changeableStores.length,
                                ),
                              ),
                      ],
                    ),
                  ),
                );
        });
  }
}
