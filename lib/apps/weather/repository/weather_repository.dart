import 'dart:convert';

import 'package:http/http.dart';
import 'package:yesplay/core/constants/constants.dart';
import 'package:yesplay/core/models/weather.dart';

class WeatherRepository {
  Future<CurrentWeather> getWeather(String location) async {
    var response = await get(Uri.parse(
        'https://api.weatherapi.com/v1/current.json?key=$weatherApiKey&q=$location&aqi=no'));
    if (response.statusCode == 200) {
      return CurrentWeather.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 400) {
      var error = jsonDecode(response.body);
      throw error['error']['message'];
    } else {
      throw 'Unknown (${response.statusCode})';
    }
  }
}
