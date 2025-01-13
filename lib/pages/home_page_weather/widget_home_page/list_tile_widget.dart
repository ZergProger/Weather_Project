import 'package:flutter/material.dart';
import 'package:weather_project/pages/dop_info_page/dop_info_weather.dart';
import 'package:weather_project/res/styles.dart';
import 'package:weather_project/weather_repository/weather_data.dart';

class ListTileWidget extends StatelessWidget {
  final WeatherData data;

  const ListTileWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        key: ValueKey(data),
        title: Text(
          data.weather,
          style: AppStyles.headerSpecial1,
        ),
        subtitle: Text(data.dateMin, style: AppStyles.headerSpecial1),
        leading: Image.network('https://openweathermap.org/img/wn/${data.idImage}@2x.png'),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DopInfoWeather(weatherData: data),
            )));
  }
}
