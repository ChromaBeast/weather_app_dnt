part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoadInProgress extends WeatherState {}

class WeatherLoadSuccess extends WeatherState {
  final Weather weather;

  WeatherLoadSuccess({required this.weather});
}

class WeatherLoadFailure extends WeatherState {}

class WeatherRefreshInProgress extends WeatherState {}
class WeatherLocationChangedSuccess extends WeatherState {
  final Weather weather;

  WeatherLocationChangedSuccess({required this.weather});
}

