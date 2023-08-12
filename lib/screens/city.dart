import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({required this.weather});
  final weather;

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  late String city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FilledButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  onChanged: (value) {
                    city = value;
                  },
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Enter city name",
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
              FilledButton(
                onPressed: () {
                  Navigator.pop(context, city);
                },
                child: Text('Get Weather'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
