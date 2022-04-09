import 'package:flutter/material.dart';

class GlobalScreen extends StatelessWidget {
  static const routeName = '/global';

  int registeredUsers = 0;
  int physicalStores = 0;
  int onlineStores = 0;
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
