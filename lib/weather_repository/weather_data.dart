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
  final String weather;
  final String idImage;
  final int temp;
  final String description;
  final String dateMin;
  final int tempMin;
  final int tempMax;
  final String dateHour;
  final String dataUnixKey;
}
