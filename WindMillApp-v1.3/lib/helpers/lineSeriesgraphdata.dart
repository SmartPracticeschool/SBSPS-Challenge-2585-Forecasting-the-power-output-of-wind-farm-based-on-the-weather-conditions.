import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';
import '../screens/jsonDataScreen.dart';

lineSeries(String name, int i) {
  List<Color> colorPallete = [
    Colors.cyan,
    Colors.red,
    Colors.black,
    Colors.white,
    Colors.yellow,
  ];
  return LineSeries<JsonData, String>(
    name: "$name",
    dataSource: getColumnData(i),
    xValueMapper: (JsonData data, _) => data.x,
    yValueMapper: (JsonData data, _) => data.y,
    color: colorPallete[i],
  );
}
