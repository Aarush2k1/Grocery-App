// ignore_for_file: deprecated_member_use, prefer_collection_literals

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:product_io/constants.dart';

final List<SubscriberSeries> data = [
  // SubscriberSeries(
  //   month: "Jan",
  //   subscribers: 10,
  //   barColor: charts.ColorUtil.fromDartColor(kToscaColor),
  // ),
  // SubscriberSeries(
  //   month: "Feb",
  //   subscribers: 20,
  //   barColor: charts.ColorUtil.fromDartColor(kToscaColor),
  // ),
  // SubscriberSeries(
  //   month: "March",
  //   subscribers: 25,
  //   barColor: charts.ColorUtil.fromDartColor(kYellowColor),
  // ),
  // SubscriberSeries(
  //   month: "April",
  //   subscribers: 45,
  //   barColor: charts.ColorUtil.fromDartColor(kOrangeColor),
  // ),
  // SubscriberSeries(
  //   month: "May",
  //   subscribers: 45,
  //   barColor: charts.ColorUtil.fromDartColor(kOrangeColor),
  // ),
  // SubscriberSeries(
  //   month: "June",
  //   subscribers: 25,
  //   barColor: charts.ColorUtil.fromDartColor(kYellowColor),
  // ),
  // SubscriberSeries(
  //   month: "July",
  //   subscribers: 30,
  //   barColor: charts.ColorUtil.fromDartColor(kYellowColor),
  // ),
  // SubscriberSeries(
  //   month: "Aug",
  //   subscribers: 60,
  //   barColor: charts.ColorUtil.fromDartColor(Colors.red),
  // ),
  SubscriberSeries(
    month: "Sep",
    subscribers: 30,
    barColor: charts.ColorUtil.fromDartColor(Colors.red),
  ),
  SubscriberSeries(
    month: "Oct",
    subscribers: 20,
    barColor: charts.ColorUtil.fromDartColor(Colors.red),
  ),
  SubscriberSeries(
    month: "Nov",
    subscribers: 55,
    barColor: charts.ColorUtil.fromDartColor(kPrimaryColor),
  ),
  SubscriberSeries(
    month: "Dec",
    subscribers: 75,
    barColor: charts.ColorUtil.fromDartColor(kPrimaryColor),
  ),
];

class SubscriberSeries {
  final String month;
  final int subscribers;
  final charts.Color barColor;

  SubscriberSeries(
      {required this.month, required this.subscribers, required this.barColor});
}
