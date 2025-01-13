import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_project/pages/dop_info_page/widget_dopinfo/dop_info_text.dart';
import 'package:weather_project/res/texts.dart';
import 'package:weather_project/res/theme.dart';
import 'package:weather_project/weather_repository/abstract_weather_repository.dart';
import 'package:weather_project/weather_repository/weather_data.dart';

class DopInfoWeather extends StatefulWidget {
  final WeatherData weatherData;

  const DopInfoWeather({
    super.key,
    required this.weatherData,
  });

  @override
  State<StatefulWidget> createState() => DopInfoWeatherState();
}

class DopInfoWeatherState extends State<DopInfoWeather> {
  List<WeatherData>? weatherDataList;

  @override
  void initState() {
    super.initState();
    _loadWeatherInfoList();
  }

  Future<void> _loadWeatherInfoList() async {
    weatherDataList = await GetIt.I<AbstractWeatherRepository>().getWeatherData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(AppTexts.textWeather),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            iconSize: 30,
          ),
        ),
        body: Center(
          child: Column(children: [TextWidgetDopInfo(weatherData: widget.weatherData)]),
        ),
      ),
    );
  }
}
