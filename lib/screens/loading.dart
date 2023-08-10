import 'package:flutter/material.dart';
import 'package:flutter_clima/services/location.dart';
import 'package:flutter_clima/services/networking.dart';

const apiKey = "afd983a0a6e85ccff8a91a8378df00b5";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;

  @override
  void initState() {
    super.initState();
    fetchLocation();
  }

  void fetchLocation() async {
    Location location = new Location();
    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;
    Networking networking = Networking(Uri.parse(
        "https://api.openweathermap.org/data/3.0/onecall?lat=$latitude&lon=$longitude&exclude=hourly,daily&appid=$apiKey"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
