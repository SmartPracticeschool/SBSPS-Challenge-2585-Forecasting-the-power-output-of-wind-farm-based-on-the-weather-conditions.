import 'package:flutter/material.dart';
import '../helpers/curvePainter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'jsonDataScreen.dart';
import '../helpers/farmDetailsTable.dart';

class FarmDetails extends StatefulWidget {
  final int i;
  FarmDetails(this.i);
  @override
  _FarmDetailsState createState() => _FarmDetailsState();
}

class _FarmDetailsState extends State<FarmDetails> {
  List<Color> colorPallete = [
    Colors.cyan,
    Colors.red,
    Colors.black,
    Colors.white,
    Colors.yellow,
  ];
  List<String> farmName = [
    'Brahmanvel Farm',
    'Dhalgaon Farm',
    'Jaisalmer Farm',
    'Muppandal Farm',
    'Satara Farm',
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Stack(
      children: <Widget>[
        CustomPaint(
          painter: CurvePainter(),
          size: Size.infinite,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            padding: EdgeInsets.fromLTRB(20.0, 0.0, 10.0, 10.0),
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: height / 5.5),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      "${farmName[widget.i]}",
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.cyan,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 40.0)),
                  Container(
                    child: Text(
                      'Wind Speed',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    height: 320,
                    width: width,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          padding: EdgeInsets.all(5.0),
                          width: 2500.0,
                          child: SfCartesianChart(
                            tooltipBehavior: TooltipBehavior(
                              duration: 5000.0,
                              enable: true,
                              borderColor: colorPallete[widget.i],
                              borderWidth: 2,
                              // TODO:
                              format: 'point.y m/s\n Date - point.x : Time',
                            ),
                            primaryXAxis: CategoryAxis(),
                            primaryYAxis: NumericAxis(),
                            series: <LineSeries<JsonData, String>>[
                              LineSeries<JsonData, String>(
                                // enableTooltip: true,
                                name: "Wind v/s Time",
                                dataSource: getColumnData(widget.i),
                                xValueMapper: (JsonData data, _) => data.x,
                                yValueMapper: (JsonData data, _) => data.y,
                                color: colorPallete[widget.i],
                                dataLabelSettings:
                                    DataLabelSettings(isVisible: true),
                                markerSettings: MarkerSettings(
                                  isVisible: true,
                                  // TODO:
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40.0),
                  ),
                  FarmDetailsTable(),
                  Padding(padding: EdgeInsets.only(top: 60.0)),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.cyan,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
