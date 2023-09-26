import 'dart:async';

import 'package:geocoding/geocoding.dart';
import 'package:open_meteo_api/open_meteo_api.dart' as MeteoWeather;
import 'package:weather_repository/weather_repository.dart';

class WeatherRepository {
  WeatherRepository({MeteoWeather.OpenMeteoApiClient? weatherApiClient})
      : _weatherApiClient =
            weatherApiClient ?? MeteoWeather.OpenMeteoApiClient();

  final MeteoWeather.OpenMeteoApiClient _weatherApiClient;

  Future<Weather> getWeather(String city) async {
    final location = await _weatherApiClient.locationSearch(city);
    final MeteoWeather.Weather weather = await _weatherApiClient.getWeather(
      latitude: location.latitude,
      longitude: location.longitude,
    );
    CurrentWeather currentWeather = CurrentWeather(
      temperature: weather.currentWeather.temperature,
      weatherCode: weather.currentWeather.weatherCode,
    );
    Daily daily = Daily(
      maxTemperatures: weather.daily.maxTemperatures,
      minTemperatures: weather.daily.minTemperatures,
    );
    return Weather(
      // temperature: weather.temperature,
      location: location.name,
      condition: weather.currentWeather.weatherCode.toInt().toCondition,
      currentWeather: currentWeather, daily: daily,
    );
  }

  Future<Weather> getCurrentLocationWeather(
      double latitude, double longitude) async {
    // final location = await _weatherApiClient.locationSearch(city);

    final MeteoWeather.Weather weather = await _weatherApiClient.getWeather(
      latitude: latitude,
      longitude: longitude,
    );
    List<Placemark> placemarks = await placemarkFromCoordinates(
      latitude,
      longitude,
    );
    // print("${placemarks}");
    CurrentWeather currentWeather = CurrentWeather(
      temperature: weather.currentWeather.temperature,
      weatherCode: weather.currentWeather.weatherCode,
    );
    Daily daily = Daily(
      maxTemperatures: weather.daily.maxTemperatures,
      minTemperatures: weather.daily.minTemperatures,
    );
    return Weather(
      currentWeather: currentWeather, daily: daily,
      condition: weather.currentWeather.weatherCode.toInt().toCondition,
      // temperature: weather.temperature,
      location:
          "${placemarks[0].street.toString()},${placemarks[0].locality.toString()}",
      // condition: weather.weatherCode.toInt().toCondition,
    );
  }
}

extension on int {
  WeatherCondition get toCondition {
    switch (this) {
      case 0:
        return WeatherCondition.clear;
      case 1:
      case 2:
      case 3:
      case 45:
      case 48:
        return WeatherCondition.cloudy;
      case 51:
      case 53:
      case 55:
      case 56:
      case 57:
      case 61:
      case 63:
      case 65:
      case 66:
      case 67:
      case 80:
      case 81:
      case 82:
      case 95:
      case 96:
      case 99:
        return WeatherCondition.rainy;
      case 71:
      case 73:
      case 75:
      case 77:
      case 85:
      case 86:
        return WeatherCondition.snowy;
      default:
        return WeatherCondition.unknown;
    }
  }
}
