// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Temperature _$TemperatureFromJson(Map<String, dynamic> json) => Temperature(
      value: (json['value'] as num).toDouble(),
    );

Map<String, dynamic> _$TemperatureToJson(Temperature instance) =>
    <String, dynamic>{
      'value': instance.value,
    };

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      daily: weather_repository.Daily.fromJson(json['daily'] as Map<String, dynamic>),
      currentWeather: weather_repository.CurrentWeather.fromJson(
          json['currentWeather'] as Map<String, dynamic>),
      condition: $enumDecode(_$WeatherConditionEnumMap, json['condition']),
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
      location: json['location'] as String,
      temperature:
          Temperature.fromJson(json['temperature'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'condition': _$WeatherConditionEnumMap[instance.condition]!,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
      'location': instance.location,
      'temperature': instance.temperature,
      'daily': instance.daily,
      'currentWeather': instance.currentWeather,
    };

const _$WeatherConditionEnumMap = {
  weather_repository.WeatherCondition.clear: 'clear',
  weather_repository.WeatherCondition.rainy: 'rainy',
  weather_repository.WeatherCondition.cloudy: 'cloudy',
  weather_repository.WeatherCondition.snowy: 'snowy',
  weather_repository.WeatherCondition.unknown: 'unknown',
};
