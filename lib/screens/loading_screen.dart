import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const kApiKey = '2ad0a4c620194b5cebca992498808d1f';
const spinkit = SpinKitRipple(
  color: Colors.amber,
  size: 150.0,
);

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$kApiKey&units=metric');
    var currentWeatherData = await networkHelper.getData();

    NetworkHelper forecastNetworkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/onecall?lat=${location.latitude}&lon=${location.longitude}&%20exclude=current,minutely,hourly&appid=$kApiKey&units=metric');
    var forecastWeatherData = await forecastNetworkHelper.getData();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LocationScreen(
                  locationWeather: currentWeatherData,
                  locationForecast: forecastWeatherData,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: spinkit,
      ),
    );
  }
}
