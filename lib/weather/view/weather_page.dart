import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';

import 'package:weather_repository/weather_repository.dart';

import '../../app/bloc/app_bloc.dart';
import '../../home/widgets/avatar.dart';
import '../../search/view/search_page.dart';
import '../../theme/cubit/theme_cubit.dart';
import '../../widgets/current_weather.dart';
import '../cubit/weather_cubit.dart';
import '../widgets/weather_empty.dart';
import '../widgets/weather_error.dart';
import '../widgets/weather_loading.dart';
import '../widgets/weather_populated.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  Position? _currentPosition;

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // executes after build
      setState(() {
        _getCurrentPosition();
      });
    });

  }
  @override
  Widget build(BuildContext context) {
    if(_currentPosition==null) {
      return Container(
        color: Colors.white,
        child: (Center(
          child: CircularProgressIndicator(),
        )),
      );
    }else{
      return BlocProvider(
        create: (context) => WeatherCubit(context.read<WeatherRepository>()),
        child:  WeatherView(latitude: _currentPosition!.latitude, longitude: _currentPosition!.longitude,),
      );
    }
  }
}

class WeatherView extends StatefulWidget {
  const WeatherView({super.key, required this.latitude, required this.longitude});
  final double latitude;
  final double longitude;
  @override
  State<WeatherView> createState() => _WeatherViewState();
}


class _WeatherViewState extends State<WeatherView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<WeatherCubit>().fetchWeatherCurrentLocation(widget.latitude, widget.longitude);
  }
  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Scaffold(

      appBar: AppBar(
        leadingWidth: 30.0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: SvgPicture.asset("assets/drawer-icon.svg"),
        ),
      //   Icon(
      //     Icons.density_large_rounded,
      //     color: Color(0xFF363B64),
      // ),
        title: const Text(
          'Weather',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),),
        centerTitle: true,
        actions: [
          IconButton(
            key: const Key('homePage_logout_iconButton'),
            icon: const Icon(Icons.exit_to_app,color: Color(0xFF363B64),),
            onPressed: () {
              context.read<AppBloc>().add(const AppLogoutRequested());
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          LiveWeather(),
          Container(
            width: 209,
            height: 343,
            decoration: ShapeDecoration(
              gradient: LinearGradient(
                begin: Alignment(-0.98, -0.21),
                end: Alignment(0.98, 0.21),
                colors: [Colors.white, Colors.white.withOpacity(0)],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
      // Center(
      //     child: BlocConsumer<WeatherCubit, WeatherState>(
      //   listener: (context, state) {
      //     if (state.status.isSuccess) {
      //       // context.read<ThemeCubit>().updateTheme(state.weather);
      //     }
      //   },
      //   builder: (context, state) {
      //     switch (state.status) {
      //       case WeatherStatus.initial:
      //         return const WeatherEmpty();
      //       case WeatherStatus.loading:
      //         return const WeatherLoading();
      //       case WeatherStatus.success:
      //         return WeatherPopulated(
      //           weather: state.weather,
      //           units: state.temperatureUnits,
      //           onRefresh: () {
      //             return context.read<WeatherCubit>().refreshWeather();
      //           },
      //         );
      //       case WeatherStatus.failure:
      //         return const WeatherError();
      //     }
      //   },
      // ),
      // ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            heroTag: "Current Location",
            backgroundColor: const Color(0xFF00BCD4),
            child: const Icon(Icons.my_location, semanticLabel: 'Current Location',),
            // label: Text("Search City"),
            onPressed: () async {
              // final city = await Navigator.of(context).push(SearchPage.route());
              // if (!mounted) return;
              context.read<WeatherCubit>().fetchWeatherCurrentLocation(widget.latitude, widget.longitude);
            },
          ),
          FloatingActionButton.extended(
            heroTag: "Search",
            backgroundColor: const Color(0xFF00BCD4),
            icon: const Icon(Icons.search, semanticLabel: 'Search',),
            label: Text("Search City"),
            onPressed: () async {
              final city = await Navigator.of(context).push(SearchPage.route());
              if (!mounted) return;
              await context.read<WeatherCubit>().fetchWeather(city);
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
