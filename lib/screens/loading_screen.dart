import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void initState() {
    super.initState();
    getWeatherData();
  }

  void getWeatherData() async {
    var weatherData = await WeatherModel().getData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(weatherData); 
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitRipple(color: Colors.white, size: 100.0),
      ),
    );
  }
}
