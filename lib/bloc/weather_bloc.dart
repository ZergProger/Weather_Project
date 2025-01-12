library blocLibrary;

import 'package:bloc/bloc.dart';
import 'package:weather_project/weather_repository/abstract_weather_repository.dart';
import 'package:weather_project/weather_repository/weather_data.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherListBloc extends Bloc<WeatherListEvent, WeatherListState> {
  WeatherListBloc(this.weatherRepository) : super(WeatherListInitial()) {
    on<WeatherListLoad>((event, emit) async {
      try {
        final weatherDataList = await weatherRepository.getWeatherData();
        emit(WeatherListLoaded(weatherList: weatherDataList));
      } catch (e) {
        emit(WeatherLoadFailed(exception: e));
      }
    });
  }

  final AbstractWeatherRepository weatherRepository;
}
