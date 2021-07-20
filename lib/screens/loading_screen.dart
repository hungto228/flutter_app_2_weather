import 'package:flutter/material.dart';
import 'package:flutter_app_2_weather/services/location.dart';
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
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
    print(" location${location.longtitude}");
    print(" location${location.latitude}");
  }

  //getdata
  void getData() async {
    Response response = await get(Uri.parse(
        "http://api.openweathermap.org/data/2.5/weather?q=London,Uk&APPID=a35293af4d5a42fb921c6d89103c4caf"));
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
    } else {
      print(response.statusCode);
    }
  }

  void somethingThatExpectsLesstThan10(int n) {
    if (n > 10) {
      throw "  n is greater than 10, n should alway be less than 10";
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
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
