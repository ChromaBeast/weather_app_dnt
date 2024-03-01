import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import '../../data/my_data.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherRequested>((event, emit) async {
      emit(WeatherLoadInProgress());
      try {
        Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        WeatherFactory wf = WeatherFactory(API_KEY, language: Language.ENGLISH);
        Weather weather = await wf.currentWeatherByLocation(position.latitude, position.longitude);
        //save the weather to the database

        emit(WeatherLoadSuccess(weather: weather));
      } catch (e) {
        emit(WeatherLoadFailure());
      }
    });
    on<WeatherRefreshRequested>((event, emit) async {
      emit(WeatherRefreshInProgress());
      try {
        Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        WeatherFactory wf = WeatherFactory(API_KEY, language: Language.ENGLISH);
        Weather weather = await wf.currentWeatherByLocation(position.latitude, position.longitude);
        emit(WeatherLoadSuccess(weather: weather));
      } catch (e) {
        emit(WeatherLoadFailure());
      }
    });
    on<WeatherLocationChanged>((event, emit) async {
      emit(WeatherLoadInProgress());
      try {
        WeatherFactory wf = WeatherFactory(API_KEY, language: Language.ENGLISH);
        Weather weather = await wf.currentWeatherByCityName(event.location);
        emit(WeatherLocationChangedSuccess(weather: weather));
      } catch (e) {
        emit(WeatherLoadFailure());
      }
    });
  }
}
