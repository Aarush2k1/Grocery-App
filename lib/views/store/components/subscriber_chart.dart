import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:product_io/constants.dart';
import 'package:product_io/views/store/components/bar_chart.dart';

class SubscriberChart extends StatelessWidget {
  final List<SubscriberSeries> data;

  SubscriberChart({required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<SubscriberSeries, String>> series = [
      charts.Series(
        id: "Subscribers",
        data: data,
        domainFn: (SubscriberSeries series, _) => series.month,
        measureFn: (SubscriberSeries series, _) =>
            series.subscribers.isEven ? series.subscribers : series.subscribers,
        colorFn: (SubscriberSeries series, _) => series.barColor,
      )
    ];
    return Container(
      height: 350,
      padding: EdgeInsets.all(8),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Products Sold",
                    style: TextStyle(color: kPurpleColor, fontSize: 20),
                  ),
                  Text("4 Months"),
                ],
              ),
              Expanded(
                child: charts.BarChart(series, animate: true),
              )
            ],
          ),
        ),
      ),
    );
  }
}
