import 'package:flutter/material.dart';
import '../helpers/curvePainter.dart';
import '../helpers/graphOutputsContainer.dart';

class GraphOutputs extends StatefulWidget {
  @override
  _GraphOutputsState createState() => _GraphOutputsState();
}

class _GraphOutputsState extends State<GraphOutputs> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Farm Specific Output",
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.cyan,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 40.0)),
                  GraphOutputsContainer(0, 'Brahmanvel Farm'),
                  Padding(padding: EdgeInsets.only(top: 40.0)),
                  GraphOutputsContainer(1, 'Dhalgaon Farm'),
                  Padding(padding: EdgeInsets.only(top: 40.0)),
                  GraphOutputsContainer(2, 'Jaisalmer Farm'),
                  Padding(padding: EdgeInsets.only(top: 40.0)),
                  GraphOutputsContainer(3, 'Muppandal Farm'),
                  Padding(padding: EdgeInsets.only(top: 40.0)),
                  GraphOutputsContainer(4, 'Satara Farm'),
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
