class CurrentWeather {
  final double temp;
  final WeatherCondition condition;
  final WeatherLocation location;

  CurrentWeather.fromJson(Map<String, dynamic> json)
      : temp = json['current']['temp_c'],
        location = WeatherLocation.fromJson(json['location']),
        condition = WeatherCondition.fromJson(json['current']['condition']);
}

class WeatherLocation {
  final String name;
  final String country;

  WeatherLocation.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        country = json['country'];
}

class WeatherCondition {
  final String text;
  final String icon;

  WeatherCondition.fromJson(Map<String, dynamic> json)
      : text = json['text'],
        icon = json['icon'];
}
