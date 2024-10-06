import 'package:flutter/material.dart';
import 'package:yesplay/apps/counter/screens/counter_screen.dart';
import 'package:yesplay/apps/weather/views/weather_screen.dart';
import 'package:yesplay/core/widgets/btn.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Btn(
                label: 'COUNTER APP',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CounterScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              Btn(
                label: 'WEATHER APP',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WeatherScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              Btn(
                label: 'TODO APP',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
