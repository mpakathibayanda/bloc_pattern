part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {}

final class SearchWeatherEvent extends WeatherEvent {
  final String location;

  SearchWeatherEvent({required this.location});
}
