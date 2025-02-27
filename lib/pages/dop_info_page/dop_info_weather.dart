import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_project/pages/dop_info_page/widgets/dop_info_text.dart';
import 'package:weather_project/res/styles.dart';
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
    weatherDataList =
        await GetIt.I<AbstractWeatherRepository>().getWeatherData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(AppTexts.textWeather, style: AppStyles.appBar),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            iconSize: 30,
          ),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
              children: [
                Row(
                  children: [
                    Image.network(
                        'https://openweathermap.org/img/wn/${widget.weatherData.idImage}@2x.png'),
                    Spacer(
                      flex: 1,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 8, left: 8, bottom: 50),
                      child: Text(
                        widget.weatherData.dateMin,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: constraints.maxWidth / 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                      width: 10,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Column(
                    children: [
                      Text(
                        widget.weatherData.weather,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: constraints.maxWidth / 15,
                        ),
                      ),
                      Text(
                        'Temperature: ${widget.weatherData.temp}°C',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: constraints.maxWidth / 20,
                        ),
                      ),
                      Text(
                        'Min temp ${widget.weatherData.tempMin}°C',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: constraints.maxWidth / 20,
                        ),
                      ),
                      Text(
                        'Max temp ${widget.weatherData.tempMax}°C',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: constraints.maxWidth / 20,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
