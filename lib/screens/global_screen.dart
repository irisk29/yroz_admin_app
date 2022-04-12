import 'package:f_logs/model/flog/flog.dart';
import 'package:flutter/material.dart';
import 'package:yroz_admin/LogicLayer/admin.dart';

class GlobalScreen extends StatefulWidget {
  static const routeName = '/global';

  @override
  State<GlobalScreen> createState() => _GlobalScreenState();
}

class _GlobalScreenState extends State<GlobalScreen> {
  int registeredUsers = 0;
  int physicalStores = 0;
  int onlineStores = 0;
  double profit = 0.0;

  Future<double> getCompanyProfit() async{
    registeredUsers = Admin().getRegisteredUsersAmount();
    physicalStores = Admin().getsAmountOfPhysicalStores();
    onlineStores = Admin().getsAmountOfOnlineStores();
    
    DateTime now = DateTime.now();
    DateTime monthAgo = DateTime(now.year, now.month - 1, now.day);
    double res = await Admin().getCompanyProfit(monthAgo, now);
    FLog.info(text: res.toString());
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCompanyProfit(),
      builder: (BuildContext context, AsyncSnapshot<double> snap) => snap
          .connectionState != ConnectionState.done
          ? Center(child: CircularProgressIndicator()) :
      Container(
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
                child: Text("YROZ Profit: ${snap.data == null ? -1 : snap.data}€",
                    style: DefaultTextStyle.of(context)
                        .style
                        .apply(fontSizeFactor: 1.2))),
          ],
        ),
      ),
    );
  }
}
