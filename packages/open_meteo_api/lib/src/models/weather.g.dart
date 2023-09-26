// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

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
        );
        return val;
      },
      fieldKeyMap: const {'currentWeather': 'current_weather'},
    );

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
