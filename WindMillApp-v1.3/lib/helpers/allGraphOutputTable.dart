import 'package:flutter/material.dart';
import 'dataRow.dart';
import '../helpers/fetchedjsondata.dart';

class AllGraphOutputTable extends StatefulWidget {
  @override
  _AllGraphOutputTableState createState() => _AllGraphOutputTableState();
}

class _AllGraphOutputTableState extends State<AllGraphOutputTable> {
  List<String> farmName = [
    'Brahmanvel Farm',
    'Dhalgaon Farm',
    'Jaisalmer Farm',
    'Muppandal Farm',
    'Satara Farm',
  ];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      child: DataTable(
        horizontalMargin: 5.0,
        columnSpacing: 37.0,
        columns: [
          DataColumn(label: Text('')),
          DataColumn(
              label: Text(
            'Best Time\n(24 Hrs)',
            style: TextStyle(color: Colors.cyan, fontSize: 15.0),
          )),
          DataColumn(
              label: Text(
            'Best Time\n(48 Hrs)',
            style: TextStyle(color: Colors.cyan, fontSize: 15.0),
          )),
        ],
        rows: [
          customRow(
            "${farmName[0]}",
            "${valueForAllGraphTable[0]}",
            "${valueForAllGraphTable[1]}",
          ),
          customRow(
            "${farmName[1]}",
            "${valueForAllGraphTable[2]}",
            "${valueForAllGraphTable[3]}",
          ),
          customRow(
            "${farmName[2]}",
            "${valueForAllGraphTable[4]}",
            "${valueForAllGraphTable[5]}",
          ),
          customRow(
            "${farmName[3]}",
            "${valueForAllGraphTable[6]}",
            "${valueForAllGraphTable[7]}",
          ),
          customRow(
            "${farmName[4]}",
            "${valueForAllGraphTable[8]}",
            "${valueForAllGraphTable[9]}",
          ),
        ],
      ),
    );
  }
}
