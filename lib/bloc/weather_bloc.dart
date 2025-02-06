library blocLibrary;

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:weather_project/weather_repository/abstract_weather_repository.dart';
import 'package:weather_project/weather_repository/weather_data.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherListBloc extends Bloc<WeatherEvent, WeatherListState> {
  WeatherListBloc(this.weatherRepository) : super(WeatherListInitial()) {
    on<WeatherListLoad>(_load);
  }

  final AbstractWeatherRepository weatherRepository;

  Future<void> _load(
    WeatherListLoad event,
    Emitter<WeatherListState> emit,
  ) async {
    try {
      emit(WeatherListLoading());
      final weatherList = await weatherRepository.getWeatherData();
      emit(WeatherListLoaded(weatherList: weatherList));
    } catch (e) {
      emit(WeatherLoadFailed(exception: e));
    }
  }
}
