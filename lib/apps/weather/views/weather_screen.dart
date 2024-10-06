import 'package:flutter/material.dart';
import 'package:yesplay/apps/weather/views/location_search.dart';
import 'package:yesplay/apps/weather/views/weather_info.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LocationSearch(),
              SizedBox(height: 25),
              WeatherInfo(),
            ],
          ),
        ),
      ),
    );
  }
}
