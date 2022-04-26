import 'package:f_logs/model/flog/flog.dart';
import 'package:flutter/material.dart';
import 'package:yroz_admin/LogicLayer/admin.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:yroz_admin/screens/email_analysis_screen.dart';

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
  Map<String, double> dataMap = {};

  late Future<void> _future;
  GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    _future = getCompanyProfit();
  }

  Future<void> getCompanyProfit() async {
    registeredUsers = Admin().getRegisteredUsersAmount();
    physicalStores = Admin().getsAmountOfPhysicalStores();
    onlineStores = Admin().getsAmountOfOnlineStores();

    dataMap = {
      "online stores": onlineStores.toDouble(),
      "physical stores": physicalStores.toDouble()
    };

    DateTime now = DateTime.now();
    DateTime monthAgo = DateTime(now.year, now.month - 1, now.day);
    profit = await Admin().getCompanyProfit(monthAgo, now);
    FLog.info(text: profit.toString());
  }

  Future<void> _pullRefresh() async {
    DateTime now = DateTime.now();
    DateTime monthAgo = DateTime(now.year, now.month - 1, now.day);
    double profitTmp = await Admin().getCompanyProfit(monthAgo, now);
    setState(() {
      registeredUsers = Admin().getRegisteredUsersAmount();
      physicalStores = Admin().getsAmountOfPhysicalStores();
      onlineStores = Admin().getsAmountOfOnlineStores();
      dataMap = {
        "online stores": onlineStores.toDouble(),
        "physical stores": physicalStores.toDouble()
      };
      profit = profitTmp;
    });
  }

  @override
  Widget build(BuildContext context) {
    final gradientList = <List<Color>>[
      [
        Color.fromARGB(255, 14, 190, 248),
        Color.fromRGBO(91, 253, 199, 1),
      ],
      [
        Color.fromRGBO(175, 63, 62, 1.0),
        Color.fromRGBO(254, 154, 92, 1),
      ]
    ];
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot snap) => snap
                  .connectionState !=
              ConnectionState.done
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              key: _refreshIndicatorKey,
              onRefresh: _pullRefresh,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.20),
                physics: AlwaysScrollableScrollPhysics(),
                child: Container(
                  alignment: AlignmentDirectional.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FittedBox(
                        child: PieChart(
                          dataMap: dataMap,
                          animationDuration: Duration(milliseconds: 800),
                          chartLegendSpacing: 32,
                          chartRadius: MediaQuery.of(context).size.width / 3.2,
                          initialAngleInDegree: 0,
                          chartType: ChartType.disc,
                          ringStrokeWidth: 32,
                          centerText: "Stores",
                          legendOptions: LegendOptions(
                            showLegendsInRow: false,
                            legendPosition: LegendPosition.right,
                            showLegends: true,
                            legendTextStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          chartValuesOptions: ChartValuesOptions(
                            showChartValueBackground: true,
                            showChartValues: true,
                            showChartValuesInPercentage: false,
                            showChartValuesOutside: false,
                            decimalPlaces: 0,
                          ),
                          gradientList: gradientList,
                          emptyColorGradient: [
                            Color(0xff6c5ce7),
                            Colors.blue,
                          ],
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      FittedBox(
                          child: Text(
                              "Number of Registered Users: $registeredUsers",
                              style: DefaultTextStyle.of(context)
                                  .style
                                  .apply(fontSizeFactor: 1.2))),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      FittedBox(
                          child: Text(
                              "YROZ Profit: $profit€",
                              style: DefaultTextStyle.of(context)
                                  .style
                                  .apply(fontSizeFactor: 1.2))),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      FittedBox(
                        child: ElevatedButton(
                          child: Text(
                            'View feedback analysis',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () => Navigator.of(context)
                              .pushReplacementNamed(
                                  EmailAnalysisScreen.routeName),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
