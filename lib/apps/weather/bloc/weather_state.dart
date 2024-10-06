part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherData extends WeatherState {
  final CurrentWeather weather;
  WeatherData({required this.weather});
}

final class WeatherError extends WeatherState {
  final String error;

  WeatherError({required this.error});
}
