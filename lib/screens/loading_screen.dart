import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
    print("hii");
  }

  //todo:get location
  void getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low,
          forceAndroidLocationManager: true);
      print(position);
    } catch (e) {
      print(e);
    }
  }

  void somethingThatExpectsLesstThan10(int n) {
    if (n > 10) {
      throw "  n is greater than 10, n should alway be less than 10";
    }
  }

  @override
  Widget build(BuildContext context) {
    String myMagin = "5s";
    dynamic myMaginAsDouble;
    try {
      myMaginAsDouble = double.parse(myMagin);
    } catch (e) {
      print(e);
      //myMaginAsDouble = 30.0;
    }
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(myMaginAsDouble ?? 30),
        color: Colors.red,
      ),
    );
  }
}
