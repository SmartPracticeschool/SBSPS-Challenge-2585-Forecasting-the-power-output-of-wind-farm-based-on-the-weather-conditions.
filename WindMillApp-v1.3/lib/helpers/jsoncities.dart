// import 'dart:convert';
// import 'package:flutter/services.dart';

// class Cities {
//   String city;

//   Cities({this.city});

//   factory Cities.fromJson(Map<String, dynamic> parsedJson) {
//     return Cities(
//       city: parsedJson as String,
//     );
//   }
// }

// class CitiesViewModel {
//   static List<Cities> cities;

//   static Future loadPlayers() async {
//     try {
//       cities = new List<Cities>();
//       String jsonString = await rootBundle.loadString('assets/cities.json');
//       Map parsedJson = json.decode(jsonString);
//       var categoryJson = parsedJson['cities'] as List;
//       for (int i = 0; i < categoryJson.length; i++) {
//         cities.add(new Cities.fromJson(categoryJson[i]));
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
// }
