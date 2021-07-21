import 'package:flutter/material.dart';
import 'package:flutter_app_2_weather/screens/location_screen.dart';
import 'package:flutter_app_2_weather/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
    var weatherData = await WeatherModel().getLocationWeather();
    print(weatherData);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  void somethingThatExpectsLesstThan10(int n) {
    if (n > 10) {
      throw "  n is greater than 10, n should alway be less than 10";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDualRing(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
