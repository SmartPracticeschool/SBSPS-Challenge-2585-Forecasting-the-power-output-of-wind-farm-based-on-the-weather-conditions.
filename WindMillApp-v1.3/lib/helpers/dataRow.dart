import 'package:flutter/material.dart';

customRow(String heading, String val1, String val2) {
  return DataRow(cells: [
    DataCell(Text(
      "$heading",
      style: TextStyle(color: Colors.cyan, fontSize: 15.0),
    )),
    DataCell(
      Text(
        "$val1",
      ),
    ),
    DataCell(
      Text("$val2"),
    ),
  ]);
}
