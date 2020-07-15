import 'package:flutter/material.dart';
import 'package:windmillApp/screens/allgraphtableJSONScreen.dart';
import '../helpers/curvePainter.dart';
import '../helpers/colorGradient.dart';
import 'selectFarm.dart';
import 'jsonDataScreen.dart';
import '../futureScope/requestYourReport.dart';
import '../helpers/fetchedjsondata.dart';
import 'allGraphOutput.dart';

class HowCanWeHelpYou extends StatefulWidget {
  @override
  _HowCanWeHelpYouState createState() => _HowCanWeHelpYouState();
}

class _HowCanWeHelpYouState extends State<HowCanWeHelpYou> {
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
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: height / 3.5),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      "How can we help you ?",
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()..shader = linearGradient,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 60.0)),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    width: width,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: EdgeInsets.all(20.0),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelectFarm(),
                          ),
                        );
                      },
                      child: Text(
                        "Power forecast\n(Location Wise)",
                        style: TextStyle(
                          fontSize: 23.0,
                        ),
                      ),
                      color: Colors.cyan[300],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 40.0)),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    width: width,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: EdgeInsets.all(20.0),
                      onPressed: () {
                        if (isLoaded) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AllGraphTableJSON(),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  //FIXME: 0 passed just because it is neccessary
                                  JsonDataScreen("howCanWeHelpYou", 0),
                            ),
                          );
                        }
                      },
                      child: Text(
                        "Optimum output",
                        style: TextStyle(
                          fontSize: 23.0,
                        ),
                      ),
                      color: Colors.cyan[300],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 40.0)),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    width: width,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: EdgeInsets.all(20.0),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RequestYourReportScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Power Forecasts for Your Own Farm",
                        style: TextStyle(
                          fontSize: 23.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      color: Colors.cyan[300],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 40.0)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
