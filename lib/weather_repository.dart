import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:weather_app/services/api_helper.dart';
import 'package:weather_app/services/location.dart';

abstract class WeatherRepository {
  Future loadWeather();

  Future saveWeatherToStorage(String weatherString);
}

class ApiLocalRepo implements WeatherRepository {
  @override
  Future loadWeather() async {
    dynamic weatherData;
    Location location = Location();
    await location.getCurrentLocation();
    ApiHelper apiHelper = ApiHelper(location.longitude, location.latitude);
    var data = await apiHelper.getData();
    if (data != 'statusIsNot200') {
      await saveWeatherToStorage(data);
      weatherData = jsonDecode(data);
    } else {
      weatherData = await loadWeatherFromStorage();
    }

    return weatherData;
  }

  @override
  Future saveWeatherToStorage(String weatherString) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('weatherString', weatherString);
  }

  Future loadWeatherFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final String? persistedWeatherString = prefs.getString('weatherString');
    return persistedWeatherString == null
        ? 'nothing_persisted'
        : jsonDecode(persistedWeatherString);
  }
}
