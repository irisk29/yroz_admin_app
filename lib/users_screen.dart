import 'package:flutter/material.dart';
import 'package:yroz_admin/purchase.dart';
import 'package:yroz_admin/user.dart';

class UsersScreen extends StatefulWidget {
  static const routeName = '/users';

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final List<User> users = [
    new User("Tal", "tal@gmail.com", 1),
    new User("Itay", "itay@gmail.com", 2),
//    new User("Itay", "itay@gmail.com", 2),
//    new User("Itay", "itay@gmail.com", 2),
  ];
  late List<bool> showPurchases = users.map((user) => false).toList();

  final List<Purchase> purchases = [
    new Purchase("tal@gmail.com", "itay@gmail.com", 100),
    new Purchase("tal@gmail.com", "itay@gmail.com", 200),
    new Purchase("itay@gmail.com", "tal@gmail.com", 300)
  ];

  List<Purchase> filterByBuyer(String buyerEmail)  {
    return purchases.where((purchase) => purchase.buyerEmail == buyerEmail).toList();
  }
  
  void showPurchase(int index) {
    setState(() {
      showPurchases[index] = !showPurchases[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return users.isEmpty
        ? Center(child: Text("NO REGISTERED USERS!"))
        : SafeArea(
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
                              child: Icon(Icons.emoji_people),
                            ),
                          ),
                        ),
                        title: Text(users[index].name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(users[index].email),
                            Text(
                                "Cashback: ${users[index].cashback.toString()}")
                          ],
                        ),
                        isThreeLine: true,
                        trailing: IconButton(
                          icon: !showPurchases[index]
                              ? Icon(Icons.expand_more)
                              : Icon(Icons.expand_less),
                          color: Theme.of(context).primaryColor,
                          onPressed: () => showPurchase(index),
                        )),
                  ),
                  showPurchases[index] ?
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (ctx, pIndex) {
                      return Column(
                        children: [
                          Card(
                            color: Colors.grey[200],
                            elevation: 5,
                            margin: EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 5,
                            ),
                            child: ListTile(
                                title: Text("Store: ${filterByBuyer(users[index].email)[pIndex].storeEmail}"),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Amount: ${filterByBuyer(users[index].email)[pIndex].amount}"),
                                  ],
                                ),
                                isThreeLine: false,
                            ),
                          ),
                        ],
                      );
                    },
                    itemCount: filterByBuyer(users[index].email).length,
                  ) : Container()
                ],
              );
            },
            itemCount: users.length,
          ));
  }
}
