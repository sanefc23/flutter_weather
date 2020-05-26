import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temperature;
  int condition;
  String cityName;
  WeatherModel weather = WeatherModel();
  String weatherIcon;
  String weatherMessage;

  @override
  void initState() {
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      temperature = (weatherData['main']['temp']).toInt();
      condition = weatherData['weather'][0]['id'];
      cityName = weatherData['name'];
      weatherIcon = weather.getWeatherIcon(condition);
      weatherMessage = weather.getMessage(temperature);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/weatherbkg.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '$temperature°',
                        style: kTempTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        weatherIcon,
                        style: kConditionTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Text(
                    "$cityName",
                    textAlign: TextAlign.center,
                    style: kMessageTextStyle,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "$weatherMessage.",
                    textAlign: TextAlign.center,
                    style: kMessageTextStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
