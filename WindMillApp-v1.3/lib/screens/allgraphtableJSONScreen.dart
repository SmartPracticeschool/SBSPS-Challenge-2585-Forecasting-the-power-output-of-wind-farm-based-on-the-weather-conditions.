import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../helpers/fetchedjsondata.dart';
import 'allGraphOutput.dart';

class AllGraphTableJSON extends StatefulWidget {
  @override
  _AllGraphTableJSONState createState() => _AllGraphTableJSONState();
}

class _AllGraphTableJSONState extends State<AllGraphTableJSON> {
  final String url = "https://ibm-wind-api.herokuapp.com/data?file=best_time";

  @override
  void initState() {
    super.initState();
    this.getJSONdata();
  }

  Future getJSONdata() async {
    var response = await http.get(
      Uri.encodeFull(url),
    );
    var data = json.decode(response.body);

    if (keyForAllGraphTable.isNotEmpty) {
      keyForAllGraphTable.removeRange(0, 10);
      valueForAllGraphTable.removeRange(0, 10);
    }
    data.forEach((k, v) {
      keyForAllGraphTable.add("$k");
      valueForAllGraphTable.add("$v");
    });
    print("this -> ${keyForAllGraphTable.length}");
    this.moveToNextScreen();
  }

  moveToNextScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (content) => AllGraphOutput(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
