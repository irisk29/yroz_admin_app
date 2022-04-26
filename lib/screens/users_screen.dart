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

  GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();

  Future<void> _pullRefresh() async {
    setState(() {});
  }

  Future<void> fetchUsers() async {
    users = await AdminMetrics().fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery
        .of(context)
        .size;
    return FutureBuilder(
        future: fetchUsers(),
        builder: (BuildContext context, AsyncSnapshot snap) {
          return snap.connectionState != ConnectionState.done
              ? Center(child: CircularProgressIndicator())
              : users.isEmpty
              ? Center(child: Text("NO REGISTERED USERS!"))
              : RefreshIndicator(
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

                        },
                        controller: editingController,
                        decoration: InputDecoration(
                            labelText: "Search",
                            hintText: "Search",
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                      ),
                    ),
                  ),
                  Container(
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
                              backgroundImage:
                              NetworkImage(users[index].imgUrl),
                              backgroundColor: Colors.transparent,
                            ),
                            title: Text(users[index].name),
                            subtitle: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(users[index].email),
                                Text(
                                    "Cashback: ${users[index].cashback
                                        .toString()}")
                              ],
                            ),
                            isThreeLine: true,
                            trailing: IconButton(
                              icon: Icon(Icons.remove_red_eye_outlined),
                              color: Theme
                                  .of(context)
                                  .primaryColor,
                              onPressed: () =>
                                  Navigator.of(context)
                                      .pushNamed(
                                      UserPurchasesScreen.routeName,
                                      arguments: {
                                        "userID": users[index].id
                                      }),
                            ),
                          ),
                        );
                      },
                      itemCount: users.length,
                    ),
                  ),
                ],
              ),
            );
        });
  }
}
