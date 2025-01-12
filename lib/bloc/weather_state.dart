part of blocLibrary;

class WeatherListState {}

class WeatherListInitial extends WeatherListState {}

class WeatherListLoading extends WeatherListState {}

class WeatherListLoaded extends WeatherListState {
  final List<WeatherData> weatherList;

  WeatherListLoaded({required this.weatherList});
}

class WeatherLoadFailed extends WeatherListState {
  final Object? exception;

  WeatherLoadFailed({required this.exception});
}
