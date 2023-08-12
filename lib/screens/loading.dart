import 'package:flutter/material.dart';
import 'package:flutter_clima/screens/location.dart';
import 'package:flutter_clima/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    fetchLocation();
  }

  void fetchLocation() async {
    var weather = await WeatherModel().getWeatherLocation();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        weather: weather,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Center(child: SpinKitDoubleBounce(color: Colors.white, size: 100.0)),
    );
  }
}
