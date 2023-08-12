import 'package:flutter/material.dart';
import 'package:flutter_clima/screens/city.dart';
import 'package:flutter_clima/services/weather.dart';
import 'package:flutter_clima/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({this.weather});
  final weather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel model = WeatherModel();
  late double temperature;
  late String message;
  late String city;
  late String icon;

  @override
  void initState() {
    super.initState();
    updateWeather(widget.weather);
  }

  void updateWeather(weather) {
    setState(() {
      temperature = weather['current']['temp'];
      city = weather['timezone'];
      var condition = weather['current']['weather'][0]['id'];
      var temp = temperature.toInt();
      message = model.getMessage(temp);
      icon = model.getWeatherIcon(condition);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FloatingActionButton(
                    heroTag: null,
                    onPressed: () async {
                      var weather = await model.getWeatherLocation();
                      updateWeather(weather);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FloatingActionButton(
                    heroTag: null,
                    onPressed: () async {
                      var weather = await model.getWeatherLocation();
                      var name = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CityScreen(
                          weather: weather,
                        );
                      }));

                      if (name) {
                        var weather = await model.getCityWeather(name);
                        city = name;
                        updateWeather(weather);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      icon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$message in $city",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
