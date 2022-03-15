import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherCubit({required this.weatherRepository}) : super(WeatherInitial());

  Future<void> getWeather() async {
    emit(const WeatherLoading());
    final weatherData = await weatherRepository.loadWeather();
    if (weatherData == 'nothing_persisted') {
      emit(
          const WeatherError("Couldn't fetch weather. Is the device online? "));
    } else {
      emit(WeatherLoaded(weatherData));
    }
  }
}



  // double currentTemperature = weatherData['current']['temp'];
  // String cityName = weatherData['timezone'];
  // int currentCondition = weatherData['current']['weather'][0]['id'];
  // var hourly = weatherData['hourly'];
  // var daily = weatherData['daily'];

