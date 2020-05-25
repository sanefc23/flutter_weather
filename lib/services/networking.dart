import 'dart:convert';

import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;

const kApiKey = '2ad0a4c620194b5cebca992498808d1f';

void getWeatherData() async {
  Location location = Location();
  await location.getCurrentLocation();
  var url =
      'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=${kApiKey}';
  http.Response response = await http.get(url);
  if (response.statusCode == 200) {
    String data = response.body;
    var weatherDescription = jsonDecode(data);
  } else {
    print(response.statusCode);
  }
}
