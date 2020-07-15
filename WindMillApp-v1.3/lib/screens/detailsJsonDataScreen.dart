import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'farmDetails.dart';
import '../helpers/fetchedjsondata.dart';

class DetailsJsonDataScreen extends StatefulWidget {
  final int i;
  DetailsJsonDataScreen(
    this.i,
  );
  @override
  _DetailsJsonDataScreenState createState() => _DetailsJsonDataScreenState();
}

class _DetailsJsonDataScreenState extends State<DetailsJsonDataScreen> {
  final List<String> url = [
    "http://flask-api.apic.eu-gb.mybluemix.net/data?file=Brahmanvel/Brahmanvel_Features_2_days",
    "http://flask-api.apic.eu-gb.mybluemix.net/data?file=Dhalgaon/Dhalgaon_Features_2_days",
    "http://flask-api.apic.eu-gb.mybluemix.net/data?file=Jaisalmer/Jaisalmer_Features_2_days",
    "http://flask-api.apic.eu-gb.mybluemix.net/data?file=Muppandal/Muppandal_Features_2_days",
    "http://flask-api.apic.eu-gb.mybluemix.net/data?file=Satara/Satara_Features_2_days",
  ];

  @override
  void initState() {
    super.initState();
    this.getJSONdata();
  }

  Future getJSONdata() async {
    var response = await http.get(
      Uri.encodeFull(url[widget.i]),
    );
    var data = json.decode(response.body);
    if (key.isNotEmpty) {
      key.removeRange(0, 16);
      value.removeRange(0, 16);
    }
    data.forEach((k, v) {
      key.add("$k");
      value.add("$v");
    });
    this.dataFormatter();
    this.moveToNextScreen();
  }

  var keyLen;
  var valLen;
  dataFormatter() {
    for (int i = 0; i < key.length; i++) {
      keyLen = key[i].length;
      if (keyLen > 5) {
        key[i] = key[i].substring(0, 6);
      }
      valLen = value[i].length;
      if (valLen > 5) {
        value[i] = value[i].substring(0, 6);
      }
    }
  }

  moveToNextScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => FarmDetails(widget.i),
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
