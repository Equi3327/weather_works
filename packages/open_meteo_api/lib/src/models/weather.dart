import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  const Weather({required this.currentWeather, required this.daily});

  final CurrentWeather currentWeather;
  final Daily daily;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => {
    'current_weather': currentWeather.toJson(),
    'daily': daily.toJson(),
  };
}

@JsonSerializable()
class CurrentWeather {
  const CurrentWeather({required this.temperature, required this.weatherCode});
  final double temperature;
  @JsonKey(name: 'weathercode')
  final double weatherCode;
  factory CurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherFromJson(json);
  Map<String, dynamic> toJson() => {
    'temperature': temperature,
    'weatherCode': weatherCode,
  };
}

@JsonSerializable()
class Daily {
  Daily({required this.maxTemperatures, required this.minTemperatures});
  @JsonKey(name: 'temperature_2m_max')
  final List<double> maxTemperatures;
  @JsonKey(name: 'temperature_2m_min')
  final List<double> minTemperatures;
  factory Daily.fromJson(Map<String, dynamic> json) =>
      _$DailyFromJson(json);
  Map<String, dynamic> toJson() => {
    "maxTemperatures":maxTemperatures,
    "minTemperatures":minTemperatures,
  };
}