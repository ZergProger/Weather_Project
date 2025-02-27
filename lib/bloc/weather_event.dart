part of blocLibrary;

abstract class WeatherEvent extends Equatable {}

class WeatherListLoad extends WeatherEvent {
  WeatherListLoad({this.completer});
  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}
