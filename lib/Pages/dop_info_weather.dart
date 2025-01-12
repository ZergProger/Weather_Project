import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_project/rec/styles.dart';
import 'package:weather_project/rec/texts.dart';
import 'package:weather_project/rec/theme.dart';
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
    _loadWeatherInfoList();
    super.initState();
  }

  Future<void> _loadWeatherInfoList() async {
    weatherDataList = await GetIt.I<AbstractWeatherRepository>().getWeatherData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
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
          child: Column(children: [
            Text(
              widget.weatherData.weather,
              style: AppStyles.headerSpecial2,
            ),
            Text(
              widget.weatherData.description,
              style: AppStyles.headerSpecial2,
            ),
            Text(
              widget.weatherData.dateHour,
              style: AppStyles.headerSpecial2,
            ),
            Text(
              'temp: ${widget.weatherData.temp}°C ',
              style: AppStyles.headerSpecial3,
            ),
            Padding(
              padding: EdgeInsets.only(
                right: 5,
                left: 5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'temp min: ${widget.weatherData.tempMin}°C ',
                    style: AppStyles.headerSpecial3,
                  ),
                  Text(
                    'temp max: ${widget.weatherData.tempMax}°C ',
                    style: AppStyles.headerSpecial3,
                  ),
                ],
              ),
            ),
            Image.network(
              'https://openweathermap.org/img/wn/${widget.weatherData.idImage}@2x.png',
              height: 100,
              width: 100,
            )
          ]),
        ),
      ),
    );
  }
}
