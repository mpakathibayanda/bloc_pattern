import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yesplay/apps/weather/repository/weather_repository.dart';
import 'package:yesplay/core/models/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _weatherRepository;
  WeatherBloc({required WeatherRepository weatherRepository})
      : _weatherRepository = weatherRepository,
        super(WeatherInitial()) {
    on<SearchWeatherEvent>(
      (event, emit) async {
        emit(WeatherLoading());
        try {
          final weather = await _weatherRepository.getWeather(event.location);
          emit(WeatherData(weather: weather));
          return;
        } catch (e) {
          log('Error on getting weather', error: e);
          emit(WeatherError(error: e.toString()));
        }
      },
    );
  }
}
