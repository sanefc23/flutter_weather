import 'package:flutter/cupertino.dart';

class Day extends Widget {
  final int day = DateTime.now().weekday;
  final int temp;
  final String condition;

  Day(this.temp, this.condition);

  @override
  Element createElement() {
    String weekday;
    switch (day) {
      case 1:
        {
          weekday = 'Monday';
          break;
        }
      case 2:
        {
          weekday = 'Tuesday';
          break;
        }
      case 3:
        {
          weekday = 'Wednesday';
          break;
        }
      case 4:
        {
          weekday = 'Thursday';
          break;
        }
      case 5:
        {
          weekday = 'Friday';
          break;
        }
      case 6:
        {
          weekday = 'Saturday';
          break;
        }
      case 7:
        {
          weekday = 'Sunday';
          break;
        }
    }

    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(weekday),
        Text(temp.toString()),
        Text(condition),
      ],
    );
  }
}
