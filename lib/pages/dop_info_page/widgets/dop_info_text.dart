import 'package:flutter/material.dart';
import 'package:weather_project/res/styles.dart';
import 'package:weather_project/res/texts.dart';
import 'package:weather_project/weather_repository/weather_data.dart';

class TextWidgetDopInfo extends StatelessWidget {
  final WeatherData weatherData;
  const TextWidgetDopInfo({
    super.key,
    required this.weatherData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          weatherData.weather,
          style: AppStyles.headerSpecial2,
        ),
        Text(
          weatherData.description,
          style: AppStyles.headerSpecial2,
        ),
        Text(
          weatherData.dateHour,
          style: AppStyles.headerSpecial2,
        ),
        Text(
          '${AppTexts.textTemperature}: ${weatherData.temp}°C ',
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
                '${AppTexts.textMinTemperature}: ${weatherData.tempMin}°C ',
                style: AppStyles.headerSpecial3,
              ),
              Text(
                '${AppTexts.textMaxTemperature}: ${weatherData.tempMax}°C ',
                style: AppStyles.headerSpecial3,
              ),
            ],
          ),
        ),
        Image.network(
          'https://openweathermap.org/img/wn/${weatherData.idImage}@2x.png',
          height: 100,
          width: 100,
        )
      ],
    );
  }
}
