import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/model/model.dart';
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
      CurrentWeather _currentWeather = CurrentWeather(weatherData: weatherData);
      HoursWeather _hoursWeather = HoursWeather(weatherData: weatherData);
      DaysWeather _daysWeather = DaysWeather(weatherData: weatherData);
      emit(WeatherLoaded(_currentWeather, _hoursWeather, _daysWeather));
    }
  }
}



  // double currentTemperature = weatherData['current']['temp'];
  // String cityName = weatherData['timezone'];
  // int currentCondition = weatherData['current']['weather'][0]['id'];
  // var hourly = weatherData['hourly'];
  // var daily = weatherData['daily'];

