import 'package:hive/hive.dart';



@HiveType(typeId: 1)
class WeatherData {
  WeatherData(
      {required this.weather,
      required this.idImage,
      required this.description,
      required this.temp,
      required this.dateMin,
      required this.tempMax,
      required this.tempMin,
      required this.dateHour,
      required this.dataUnixKey});
  @HiveField(0)
  final String weather;
  @HiveField(1)
  final String idImage;
  @HiveField(2)
  final int temp;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final String dateMin;
  @HiveField(5)
  final int tempMin;
  @HiveField(6)
  final int tempMax;
  @HiveField(7)
  final String dateHour;
  @HiveField(8)
  final String dataUnixKey;
}
