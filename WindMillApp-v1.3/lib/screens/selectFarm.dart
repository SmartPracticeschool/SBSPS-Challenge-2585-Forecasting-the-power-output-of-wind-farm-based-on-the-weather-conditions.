import 'package:flutter/material.dart';
import '../helpers/curvePainter.dart';
import '../helpers/fetchedjsondata.dart';
import 'jsonDataScreen.dart';
import 'detailsJsonDataScreen.dart';

class SelectFarm extends StatefulWidget {
  @override
  _SelectFarmState createState() => _SelectFarmState();
}

class _SelectFarmState extends State<SelectFarm> {
  int currentSelection = 0;
  List<String> farmName = [
    'Brahmanvel Farm, Dhule, Maharashtra',
    'Dhalgaon Farm, Sangli, Maharashtra',
    'Jaisalmer Farm, Jaisalmer, Rajasthan',
    'Muppandal Farm, Kanyakumari, Tamil Nadu',
    'Satara Farm, Satara, Maharashtra',
  ];

  navigate() {
    isLoaded
        ? Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  DetailsJsonDataScreen(this.currentSelection),
            ),
          )
        : Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => JsonDataScreen(
                "selectTheWindFarm",
                this.currentSelection,
              ),
            ),
          );
  }

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
                      "Select wind farm",
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.cyan,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 30.0)),
                  Container(
                    width: width,
                    height: (120.0 * 5) + (20 * 3),
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: farmName.length,
                      itemBuilder: (context, i) => Container(
                        padding: EdgeInsets.only(bottom: 20.0),
                        height: 110.0,
                        width: width,
                        child: RaisedButton(
                          splashColor: Colors.cyan,
                          highlightColor: Colors.cyan,
                          elevation: 10.0,
                          padding: EdgeInsets.fromLTRB(10.0, 7.0, 10.0, 7.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          color: Colors.grey,
                          onPressed: () {
                            setState(() {
                              this.currentSelection = i;
                              navigate();
                            });
                          },
                          child: Text(
                            "${farmName[i]}",
                            style: TextStyle(
                              fontSize: 23.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
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
