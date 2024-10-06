import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yesplay/apps/weather/bloc/weather_bloc.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherData) {
          final weather = state.weather;
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(
                CupertinoIcons.thermometer,
                color: Colors.amber,
                size: 110,
              ),
              Column(
                children: [
                  Text(
                    '${weather.temp}°',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 72,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.location_pin),
                      Text(
                        '${weather.location.name}, ${weather.location.country}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        }
        if (state is WeatherError) {
          return Center(
            child: Text(
              state.error,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          );
        }
        if (state is WeatherLoading) {
          return const Center(
            child: Text(
              'Loading...',
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
          );
        }
        return const Center(
          child: Text(
            'Loading...',
            style: TextStyle(
              color: Colors.black,
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
          ),
        );
      },
    );
  }
}
