import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/model/model.dart';
import 'package:weather_app/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherCubit({required this.weatherRepository})
      : super(const WeatherInitial());

  Future<void> getWeather() async {
    emit(const WeatherLoading());
    final weatherData = await weatherRepository.loadWeather();
    if (weatherData == 'nothing_persisted') {
      emit(
          const WeatherError("Couldn't fetch weather. Is the device online? "));
    } else {
      CurrentWeather _currentWeather = CurrentWeather(weatherData: weatherData);
      final _hoursWeatherList = List<HoursWeather>.generate(
          24,
          (index) =>
              HoursWeather(weatherData: weatherData, numberInList: index));
      final _daysWeatherList = List<DaysWeather>.generate(
          8,
          (index) =>
              DaysWeather(weatherData: weatherData, numberInList: index));
      emit(WeatherLoaded(_currentWeather, _hoursWeatherList, _daysWeatherList));
    }
  }
}
