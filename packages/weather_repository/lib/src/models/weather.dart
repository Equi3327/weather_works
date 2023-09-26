import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

enum WeatherCondition {
  clear,
  rainy,
  cloudy,
  snowy,
  unknown,
}

@JsonSerializable()
class Weather extends Equatable {
  const Weather({
    required this.currentWeather,
    required this.daily,
    required this.condition,
    required this.location,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  final CurrentWeather currentWeather;
  final Daily daily;
  final String location;
  final WeatherCondition condition;

  @override
  List<Object> get props => [currentWeather, daily, condition,location];
}


@JsonSerializable()
class CurrentWeather {
  const CurrentWeather({required this.temperature, required this.weatherCode});
  final double temperature;
  @JsonKey(name: 'weathercode')
  final double weatherCode;
  factory CurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentWeatherToJson(this);
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
  Map<String, dynamic> toJson() => _$DailyToJson(this);
}