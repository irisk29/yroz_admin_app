import 'package:flutter/material.dart';
import 'package:yroz_admin/LogicLayer/admin.dart';

class GlobalScreen extends StatelessWidget {
  static const routeName = '/global';

  int registeredUsers = Admin().getRegisteredUsersAmount();
  int physicalStores = Admin().getsAmountOfPhysicalStores();
  int onlineStores = Admin().getsAmountOfOnlineStores();
  double profit = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
              child: Text("Number of Registered Users: $registeredUsers",
                  style: DefaultTextStyle.of(context)
                      .style
                      .apply(fontSizeFactor: 1.2))),
          SizedBox(height: 8),
          FittedBox(
              child: Text("Number of Physical Stores: $physicalStores",
                  style: DefaultTextStyle.of(context)
                      .style
                      .apply(fontSizeFactor: 1.2))),
          SizedBox(height: 8),
          FittedBox(
              child: Text("Number of Online Stores: $onlineStores",
                  style: DefaultTextStyle.of(context)
                      .style
                      .apply(fontSizeFactor: 1.2))),
          SizedBox(height: 8),
          FittedBox(
              child: Text("YROZ Profit: $profit₪",
                  style: DefaultTextStyle.of(context)
                      .style
                      .apply(fontSizeFactor: 1.2))),
        ],
      ),
    );
  }
}
