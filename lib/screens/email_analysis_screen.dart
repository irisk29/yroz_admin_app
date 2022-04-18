import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
import 'package:yroz_admin/FeedbackAnalysis/feedback_analysis.dart';
import 'package:yroz_admin/screens/tabs_screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class EmailAnalysisScreen extends StatefulWidget {
  static const routeName = '/analysis';

  @override
  State<EmailAnalysisScreen> createState() => _EmailAnalysisScreen();
}

class _EmailAnalysisScreen extends State<EmailAnalysisScreen> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  Future<Tuple2<Map<String, double>, List<String>>> getEmailAnalysis() async {
    var res = await FeedBackAnalysis().getEmailAnalysis();
    if (res.getTag()) return res.getValue()!;
    return res.getValue()!;
  }

  Widget _buildRatingsCart(Map<String, double> ratings) {
    List<_ChartData> data = ratings.entries
        .map((e) => _ChartData(e.key, e.value, Colors.primaries[Random().nextInt(Colors.primaries.length)]))
        .toList();
    return SfCartesianChart(
        primaryXAxis: CategoryAxis(labelIntersectAction: AxisLabelIntersectAction.multipleRows),
        primaryYAxis: NumericAxis(minimum: 0, maximum: 5, interval: 1, isVisible: true),
        tooltipBehavior: _tooltip,
        series: <ChartSeries<_ChartData, String>>[
          ColumnSeries<_ChartData, String>(
              dataSource: data,
              xValueMapper: (_ChartData data, _) => data.x,
              yValueMapper: (_ChartData data, _) => data.y,
              pointColorMapper: (_ChartData data, _) => data.color,
              name: 'rating',
              spacing: 0.5)
        ]);
  }

  Widget _buildFeedBackList(List<String> feedbacks) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: feedbacks.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.05,
            child: Center(child: Text(feedbacks[index])),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pushReplacementNamed(TabsScreen.routeName),
        ),
        toolbarHeight: deviceSize.height * 0.1,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Feedback Analysis",
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: getEmailAnalysis(),
        builder: (BuildContext context, AsyncSnapshot<Tuple2<Map<String, double>, List<String>>> snap) {
          return snap.connectionState != ConnectionState.done
              ? Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    snap.data != null && snap.data!.item1.length > 0
                        ? _buildRatingsCart(snap.data!.item1)
                        : Text("No ratings were sent yet"),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Text(
                      "Feedback From Users:",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    snap.data != null && snap.data!.item2.length > 0
                        ? _buildFeedBackList(snap.data!.item2)
                        : Text("No feedbacks were sent yet")
                  ],
                );
        },
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y, this.color);

  final String x;
  final double y;
  final Color? color;
}
