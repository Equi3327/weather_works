// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Weather',
      json,
      ($checkedConvert) {
        final val = Weather(
          currentWeather: $checkedConvert('current_weather',
              (v) => CurrentWeather.fromJson(v as Map<String, dynamic>)),
          daily: $checkedConvert(
              'daily', (v) => Daily.fromJson(v as Map<String, dynamic>)),
          condition: $checkedConvert(
              'condition', (v) => $enumDecode(_$WeatherConditionEnumMap, v)),
          location: $checkedConvert('location', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'currentWeather': 'current_weather'},
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'current_weather': instance.currentWeather,
      'daily': instance.daily,
      'location': instance.location,
      'condition': _$WeatherConditionEnumMap[instance.condition]!,
    };

const _$WeatherConditionEnumMap = {
  WeatherCondition.clear: 'clear',
  WeatherCondition.rainy: 'rainy',
  WeatherCondition.cloudy: 'cloudy',
  WeatherCondition.snowy: 'snowy',
  WeatherCondition.unknown: 'unknown',
};

CurrentWeather _$CurrentWeatherFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CurrentWeather',
      json,
      ($checkedConvert) {
        final val = CurrentWeather(
          temperature:
              $checkedConvert('temperature', (v) => (v as num).toDouble()),
          weatherCode:
              $checkedConvert('weathercode', (v) => (v as num).toDouble()),
        );
        return val;
      },
      fieldKeyMap: const {'weatherCode': 'weathercode'},
    );

Map<String, dynamic> _$CurrentWeatherToJson(CurrentWeather instance) =>
    <String, dynamic>{
      'temperature': instance.temperature,
      'weathercode': instance.weatherCode,
    };

Daily _$DailyFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Daily',
      json,
      ($checkedConvert) {
        final val = Daily(
          maxTemperatures: $checkedConvert(
              'temperature_2m_max',
              (v) => (v as List<dynamic>)
                  .map((e) => (e as num).toDouble())
                  .toList()),
          minTemperatures: $checkedConvert(
              'temperature_2m_min',
              (v) => (v as List<dynamic>)
                  .map((e) => (e as num).toDouble())
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {
        'maxTemperatures': 'temperature_2m_max',
        'minTemperatures': 'temperature_2m_min'
      },
    );

Map<String, dynamic> _$DailyToJson(Daily instance) => <String, dynamic>{
      'temperature_2m_max': instance.maxTemperatures,
      'temperature_2m_min': instance.minTemperatures,
    };
