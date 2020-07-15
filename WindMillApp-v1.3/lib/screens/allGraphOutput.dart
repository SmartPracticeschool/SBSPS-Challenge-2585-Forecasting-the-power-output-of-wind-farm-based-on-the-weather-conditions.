import 'package:flutter/material.dart';
import '../helpers/curvePainter.dart';
import '../screens/jsonDataScreen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../helpers/lineSeriesgraphdata.dart';
import 'graphOutputs.dart';
import '../helpers/allGraphOutputTable.dart';
import 'pdfScreen.dart';

class AllGraphOutput extends StatefulWidget {
  @override
  _AllGraphOutputState createState() => _AllGraphOutputState();
}

class _AllGraphOutputState extends State<AllGraphOutput> {
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: width,
                    child: Text(
                      "Collective Output",
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.cyan,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 40.0)),
                  Container(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "Rotate Screen",
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(right: 10.0)),
                        Icon(
                          Icons.crop_rotate,
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    height: 370.0,
                    width: width,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 7.0),
                          child: SfCartesianChart(
                            zoomPanBehavior: ZoomPanBehavior(
                              // enableDoubleTapZooming: true,
                              enablePinching: true,
                            ),
                            legend: Legend(
                              width: "100%",
                              position: LegendPosition.bottom,
                              overflowMode: LegendItemOverflowMode.wrap,
                              isVisible: true,
                              textStyle: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                            primaryXAxis: CategoryAxis(),
                            primaryYAxis: NumericAxis(),
                            series: <LineSeries<JsonData, String>>[
                              //Multi graph
                              lineSeries("Brahmanvel Farm", 0),
                              lineSeries("Dhalgaon Farm", 1),
                              lineSeries("Jaisalmer Farm", 2),
                              lineSeries("Muppandal Farm", 3),
                              lineSeries("Satara Farm", 4),
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 20.0)),
                        Container(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => GraphOutputs(),
                                  ));
                            },
                            child: Text(
                              "Click here to expand",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.cyanAccent,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 40.0)),
                  Center(
                    child: RaisedButton(
                      padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: Colors.cyan,
                      child: Text(
                        "Click here to view report",
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PdfScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 40.0)),
                  AllGraphOutputTable(),
                  Padding(padding: EdgeInsets.only(top: 70.0)),
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
