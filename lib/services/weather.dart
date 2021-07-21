import 'location.dart';
import 'networking.dart';

const apiKey = "a35293af4d5a42fb921c6d89103c4caf";
const openWeatherMapUrl = "http://api.openweathermap.org/data/2.5/weather";

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurentLocation();

    NetworkHelper helper = NetworkHelper(
        "$openWeatherMapUrl?lat=${location.latitude}&lon=${location.longtitude}&appid=$apiKey&units=metric");
    var weatherData = await helper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
