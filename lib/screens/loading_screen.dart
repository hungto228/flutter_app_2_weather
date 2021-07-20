import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_2_weather/services/location.dart';
import 'package:flutter_app_2_weather/services/networking.dart';
import 'package:http/http.dart';

const apiKey = "a35293af4d5a42fb921c6d89103c4caf";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  var latitude;
  var longtitude;

  @override
  void initState() {
    super.initState();
    getLocation();
    //   getData();
    print("hii");
  }

  //todo:get location
  void getLocation() async {
    Location location = Location();
    await location.getCurentLocation();
    latitude = location.latitude;
    longtitude = location.longtitude;
    // latitude = 35;
    // longtitude = 139;
    NetworkHelper helper = NetworkHelper(
        "http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longtitude&appid=$apiKey");
    var weatherData = await helper.getData();
    print(weatherData);
  }

  void somethingThatExpectsLesstThan10(int n) {
    if (n > 10) {
      throw "  n is greater than 10, n should alway be less than 10";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
    // String myMagin = "5s";
    // dynamic myMaginAsDouble;
    // try {
    //   myMaginAsDouble = double.parse(myMagin);
    // } catch (e) {
    //   print(e);
    //   //myMaginAsDouble = 30.0;
    // }
    // return Scaffold(
    //   body: Container(
    //     margin: EdgeInsets.all(myMaginAsDouble ?? 30),
    //     color: Colors.red,
    //   ),
    // );
  }
}
