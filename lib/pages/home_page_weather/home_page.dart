import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_project/bloc/weather_bloc.dart';
import 'package:weather_project/pages/home_page_weather/widgets/listView.dart';
import 'package:weather_project/res/styles.dart';
import 'package:weather_project/res/texts.dart';
import 'package:weather_project/weather_repository/abstract_weather_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final weatherListBloc = WeatherListBloc(GetIt.I<AbstractWeatherRepository>());

  final _weatherListBloc = WeatherListBloc(
    GetIt.I<AbstractWeatherRepository>(),
  );

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
    _weatherListBloc.add(WeatherListLoad());
  }

  late Completer<void> _refreshCompleter;

  final completer = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppTexts.textWeather,
            style: AppStyles.appBar,
          ),
        ),
        body: ListViewCustom(
          weatherListBloc: _weatherListBloc,
          refreshCompleter: _refreshCompleter,
        ));
  }
}
