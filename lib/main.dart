import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_project/pages/home_page_weather/home_page.dart';
import 'package:weather_project/bloc/weather_bloc.dart';
import 'package:weather_project/res/theme.dart';
import 'package:weather_project/utils/routes.dart';
import 'package:weather_project/weather_repository/abstract_weather_repository.dart';
import 'package:weather_project/weather_repository/weather_repository.dart';
import 'package:weather_project/utils/route_name.dart';

final weatherListBloc = WeatherListBloc(GetIt.I<AbstractWeatherRepository>());
final dio = Dio();
void main() {
  GetIt.I.registerLazySingleton<AbstractWeatherRepository>(() => WeatherRepository(dio: dio));
  GetIt.I.registerSingleton(WeatherRepository(dio: dio));
  runApp(MainScreen());
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: route(HomePage),
      routes: generateRoutes(),
    );
  }
}
