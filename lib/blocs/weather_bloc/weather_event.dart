part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

class WeatherRequested extends WeatherEvent {}

class WeatherRefreshRequested extends WeatherEvent {}

class WeatherLocationChanged extends WeatherEvent {
  final String location;

  WeatherLocationChanged({required this.location});
}
