import 'package:flutter/material.dart';
import 'package:weather_repository/weather_repository.dart';

import '../../app.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Page<void> page() => MaterialPage<void>(
          child: HomePage());

  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;
    // final user = context.select((AppBloc bloc) => bloc.state.user);
    return WeatherApp(weatherRepository: WeatherRepository());
  }
}
