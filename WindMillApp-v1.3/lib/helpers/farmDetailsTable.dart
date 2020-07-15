import 'package:flutter/material.dart';
import '../helpers/dataRow.dart';
import '../helpers/fetchedjsondata.dart';

class FarmDetailsTable extends StatefulWidget {
  @override
  _FarmDetailsTableState createState() => _FarmDetailsTableState();
}

class _FarmDetailsTableState extends State<FarmDetailsTable> {
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
            'Today',
            style: TextStyle(color: Colors.cyan, fontSize: 15.0),
          )),
          DataColumn(
              label: Text(
            'Tommorow',
            style: TextStyle(color: Colors.cyan, fontSize: 15.0),
          )),
        ],
        rows: [
          customRow(
            "Clouds Today",
            "${value[0]}",
            "${value[1]}",
          ),
          customRow(
            "Humidity (%)",
            "${value[2]}",
            "${value[3]}",
          ),
          customRow(
            "Ozone (Dobson)",
            "${value[4]}",
            "${value[5]}",
          ),
          customRow(
            "Precipitation (mm)",
            "${value[6]}",
            "${value[7]}",
          ),
          customRow(
            "Pressure (millibars)",
            "${value[8]}",
            "${value[9]}",
          ),
          customRow(
            "Temperature (°C)",
            "${value[10]}",
            "${value[11]}",
          ),
          customRow(
            "UV Index (UV)",
            "${value[12]}",
            "${value[13]}",
          ),
        ],
      ),
    );
  }
}
