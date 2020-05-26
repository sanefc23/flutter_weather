import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'SpartanMB',
  fontSize: 60.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'SpartanMB',
  fontSize: 30.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'SpartanMB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 60.0,
);

const kSearchCityTextField = InputDecoration(
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    labelStyle: TextStyle(
      letterSpacing: 1.5,
      color: Colors.white,
      fontSize: 18,
    ),
    labelText: 'City Name',
    hintText: 'Enter a city name');
