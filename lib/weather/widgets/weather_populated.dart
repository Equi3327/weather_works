import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/weather.dart';
import '../weather.dart';

class WeatherPopulated extends StatelessWidget {
  const WeatherPopulated({
    required this.weather,
    required this.units,
    required this.onRefresh,
    super.key,
  });

  final Weather weather;
  final TemperatureUnits units;
  final ValueGetter<Future<void>> onRefresh;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        _WeatherBackground(),
        RefreshIndicator(
          onRefresh: onRefresh,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            clipBehavior: Clip.none,
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 48),
                  _WeatherIcon(condition: weather.condition),
                  Text(
                    weather.location,
                    style: theme.textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  Text(
                    weather.formattedTemperature(units),
                    style: theme.textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '''Last Updated at ${TimeOfDay.fromDateTime(weather.lastUpdated).format(context)}''',
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0,),
                    width: width*0.8,
                    height: height*0.6,
                    // color: Colors.red,
                    child: ListView.separated(
                        itemCount: weather.daily.maxTemperatures.length,
                      separatorBuilder: (BuildContext context, int index) => const Divider(),
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.only(left: 10.0),
                          leading: Text('${index+1}.'),
                          title: Text(formattedDayTime(DateTime.now().add(Duration(days: index)))),
                          trailing: Text(formattedTemperature(units,weather.daily.maxTemperatures[index])),
                        );
                      },
                        )
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _WeatherIcon extends StatelessWidget {
  const _WeatherIcon({required this.condition});

  static const _iconSize = 75.0;

  final WeatherCondition condition;

  @override
  Widget build(BuildContext context) {
    return Text(
      condition.toEmoji,
      style: const TextStyle(fontSize: _iconSize),
    );
  }
}

extension on WeatherCondition {
  String get toEmoji {
    switch (this) {
      case WeatherCondition.clear:
        return '☀️';
      case WeatherCondition.rainy:
        return '🌧️';
      case WeatherCondition.cloudy:
        return '☁️';
      case WeatherCondition.snowy:
        return '🌨️';
      case WeatherCondition.unknown:
        return '❓';
    }
  }
}

class _WeatherBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.25, 0.75, 0.90, 1.0],
            colors: [
              color,
              color.brighten(),
              color.brighten(33),
              color.brighten(50),
            ],
          ),
        ),
      ),
    );
  }
}

extension on Color {
  Color brighten([int percent = 10]) {
    assert(
      1 <= percent && percent <= 100,
      'percentage must be between 1 and 100',
    );
    final p = percent / 100;
    return Color.fromARGB(
      alpha,
      red + ((255 - red) * p).round(),
      green + ((255 - green) * p).round(),
      blue + ((255 - blue) * p).round(),
    );
  }
}

extension on Weather {
  String formattedTemperature(TemperatureUnits units) {
    return '''${temperature.value.toStringAsPrecision(2)}°${units.isCelsius ? 'C' : 'F'}''';
  }
}

String formattedTemperature(TemperatureUnits units,double value) {
  return '''${value.toStringAsPrecision(2)}°${units.isCelsius ? 'C' : 'F'}''';
}

String formattedDayTime(DateTime date) {
  final DateFormat formatter = DateFormat.MMMd();
  final String formatted = formatter.format(date);
  return formatted;
}