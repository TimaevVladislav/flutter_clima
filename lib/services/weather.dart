import 'package:flutter_clima/services/location.dart';
import 'package:flutter_clima/services/networking.dart';

const apiKey = "afd983a0a6e85ccff8a91a8378df00b5";

class WeatherModel {
  Future<dynamic> getCityWeather(String city) async {
    Location location = new Location();
    await location.getCurrentLocation();

    Networking networking = Networking(Uri.parse(
        "https://api.openweathermap.org/data/2.5/onecall?q=$city&units=metric&appid=$apiKey"));
    var weather = await networking.getWeather();
    return weather;
  }

  Future<dynamic> getWeatherLocation() async {
    Location location = new Location();
    await location.getCurrentLocation();

    Networking networking = Networking(Uri.parse(
        "https://api.openweathermap.org/data/2.5/onecall?lat=${location.latitude}&lon=${location.longitude}&units=metric&appid=$apiKey"));
    var weather = await networking.getWeather();
    return weather;
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
