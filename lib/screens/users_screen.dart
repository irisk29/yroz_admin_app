import 'package:flutter/material.dart';
import 'package:yroz_admin/DTO/purchase.dart';
import 'package:yroz_admin/DTO/user.dart';
import 'package:yroz_admin/DataLayer/admin_metrics.dart';
import 'package:yroz_admin/screens/user_purchases_screen.dart';

class UsersScreen extends StatefulWidget {
  static const routeName = '/users';

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  TextEditingController editingController = TextEditingController();
  List<User> users = [];
  List<User> changeableUsers = [];

  late Future<void> _future;
  GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    _future = fetchUsers();
  }

  Future<void> _pullRefresh() async {
    List<User> usersTmp = await AdminMetrics().fetchUsers();
    changeableUsers.addAll(users);
    setState(() {
      users = usersTmp;
      changeableUsers.clear();
      changeableUsers.addAll(users);
    });
  }

  Future<void> fetchUsers() async {
    users = await AdminMetrics().fetchUsers();
    changeableUsers.addAll(users);
  }

  void filterSearchResults(String query) {
    List<User> dummySearchList = [];
    dummySearchList.addAll(users);
    if (query.isNotEmpty) {
      List<User> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.name.toLowerCase().contains(query.toLowerCase()) ||
            item.email.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        changeableUsers.clear();
        changeableUsers.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        changeableUsers.clear();
        changeableUsers.addAll(users);
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
                        changeableUsers.isEmpty
                            ? Container(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.30),
                                child:
                                    Center(child: Text("NO REGISTERED USERS!")))
                            : Container(
                                height: deviceSize.height * 0.685,
                                child: ListView.builder(
                                  itemBuilder: (ctx, index) {
                                    return Card(
                                      elevation: 5,
                                      margin: EdgeInsets.symmetric(
                                        vertical: 8,
                                        horizontal: 5,
                                      ),
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          radius: 25,
                                          backgroundImage: NetworkImage(
                                              changeableUsers[index].imgUrl),
                                          backgroundColor: Colors.transparent,
                                        ),
                                        title:
                                            Text(changeableUsers[index].name),
                                        subtitle: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(changeableUsers[index].email),
                                            Text(
                                                "Cashback: ${changeableUsers[index].cashback.toString()}")
                                          ],
                                        ),
                                        isThreeLine: true,
                                        trailing: IconButton(
                                          icon: Icon(
                                              Icons.remove_red_eye_outlined),
                                          color: Theme.of(context).primaryColor,
                                          onPressed: () => Navigator.of(context)
                                              .pushNamed(
                                                  UserPurchasesScreen.routeName,
                                                  arguments: {
                                                "userID":
                                                    changeableUsers[index].id
                                              }),
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: changeableUsers.length,
                                ),
                              ),
                      ],
                    ),
                  ),
                );
        });
  }
}
