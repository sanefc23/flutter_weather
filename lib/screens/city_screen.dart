import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bkg3.jpeg'),
            fit: BoxFit.fill,
            alignment: Alignment.topCenter,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.5), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                width: 350,
                padding: EdgeInsets.all(20.0),
                child: TextFormField(
                  cursorColor: Colors.tealAccent,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, fontFamily: 'SpartanMB'),
                  decoration: kSearchCityTextField,
                  onChanged: (value) {},
                ),
              ),
              FlatButton(
                color: Color.fromRGBO(255, 255, 255, 0.2),
                onPressed: () {},
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
