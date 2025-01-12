import 'package:weather_project/weather_repository/weather_data.dart';

abstract class AbstractWeatherRepository {
  Future<List<WeatherData>> getWeatherData();
}
