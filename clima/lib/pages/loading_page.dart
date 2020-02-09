import 'package:clima/services/weather_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

WeatherService weatherService = new WeatherService();

class LoadingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoadingPage();
}

class _LoadingPage extends State<LoadingPage> {
  final spinKit = SpinKitDoubleBounce(
    color: Colors.white,
    size: 50.0,
  );

  @override
  void initState() {
    super.initState();
    weatherService.getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: spinKit,
      ),
    );
  }
}
