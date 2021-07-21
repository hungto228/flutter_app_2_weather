import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_2_weather/screens/city_screen.dart';
import 'package:flutter_app_2_weather/services/weather.dart';
import 'package:flutter_app_2_weather/ulties/constants.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  late int temprature;
  late String weatherIcon;
  late String cityName;
  late String weatherMessage;

  @override
  void initState() {
    super.initState();
    updateUi(widget.locationWeather);
  }

  void updateUi(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temprature = 0;
        weatherIcon = Icon(Icons.error) as String;
        weatherMessage = "Unable to get weather data";
        cityName = "error";
        return;
      } else {
        double temp = weatherData['main']['temp'];
        temprature = temp.toInt();
        var condition = weatherData["weather"][0]["id"];
        weatherIcon = weatherModel.getWeatherIcon(condition);
        weatherMessage = weatherModel.getMessage(temprature);
        cityName = weatherData["name"];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/location_background.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.8), BlendMode.dstATop))),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                      onPressed: () async {
                        var weatherData =
                            await weatherModel.getLocationWeather();
                        updateUi(weatherData);
                      },
                      child: Icon(
                        Icons.near_me,
                        size: 50.0,
                      )),
                  FlatButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return CityScreen();
                        }));
                      },
                      child: Icon(
                        Icons.location_city,
                        size: 50.0,
                      ))
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Text(
                      "$temprature",
                      style: kTempTextStyle,
                    ),
                    Text(
                      "$weatherIcon",
                      style: kConditionTextStyle,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$weatherMessage in $cityName',
                  textAlign: TextAlign.center,
                  style: kMessageTextStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
