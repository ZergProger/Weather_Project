import 'package:dio/dio.dart';
import 'package:weather_project/weather_repository/abstract_weather_repository.dart';
import 'package:weather_project/weather_repository/weather_data.dart';
import 'package:jiffy/jiffy.dart';

class WeatherRepository implements AbstractWeatherRepository {
  WeatherRepository({required this.dio});
  final Dio dio;

  @override
  Future<List<WeatherData>> getWeatherData() async {
    try {
      final response = await dio.get(
          'https://api.openweathermap.org/data/2.5/forecast?lat=44.24&lon=26.05&appid=a62303ba67511e46322636e2b86ef269&lang=ru&units=metric');
      final data = response.data as Map<String, dynamic>;
      final dataWeatherList = data['list'] as List<dynamic>;

      final weatherDataList = dataWeatherList.map((e) {
        final main = e['main'] as Map<String, dynamic>;
        final weather = e['weather'] as List<dynamic>;

        final weatherDataType = weather[0]['main'] as String;
        final idIcon = weather[0]['icon'] as String;
        final weatherDescription = weather[0]['description'] as String;
        final temp = (main['temp'] as num).toDouble();
        final dateUnix = e['dt'] as int;
        final tempMin = (main['temp_min'] as double).toDouble();
        final tempMax = (main['temp_max'] as double).toDouble();

        DateTime dateTime1 = DateTime.fromMillisecondsSinceEpoch(dateUnix * 1000);
        String formattedDateHourMin = Jiffy(dateTime1).format("dd.MM HH:mm");

        DateTime dateTime2 = DateTime.fromMillisecondsSinceEpoch(dateUnix * 1000);
        String formattedDateHour = Jiffy(dateTime2).format("dd.MM");

        int tempr = temp.round();
        int temprMin = tempMin.round();
        int temprMax = tempMax.round();

        return WeatherData(
          dataUnixKey: formattedDateHour,
          dateHour: formattedDateHour,
          tempMax: temprMax,
          tempMin: temprMin,
          weather: weatherDataType,
          idImage: idIcon,
          description: weatherDescription,
          temp: tempr,
          dateMin: formattedDateHourMin,
        );
      }).toList();
      return weatherDataList;
    } catch (e) {
      return [];
    }
  }
}
