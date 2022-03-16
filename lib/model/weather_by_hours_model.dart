import 'package:weather_app/services/weather_icons.dart';

class HoursWeather {
  final dynamic weatherData;
  late final String cityName;
  late final double currentTemperature;
  late final int currentCondition;
  late final String weatherIcon;
  late final String weatherMessage;

  HoursWeather({required this.weatherData}) {
    currentTemperature = weatherData['current']['temp'];
    cityName = weatherData['timezone'];
    currentCondition = weatherData['current']['weather'][0]['id'];
    var weatherIcons = WeatherIcons();
    weatherIcon = weatherIcons.getWeatherIcon(currentCondition);
    weatherMessage = weatherIcons.getMessage(currentTemperature.toInt());
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HoursWeather && other.weatherData == weatherData;
  }

  @override
  int get hashCode =>
      weatherData.hashCode ^
      cityName.hashCode ^
      currentTemperature.hashCode ^
      currentCondition.hashCode ^
      weatherIcon.hashCode ^
      weatherMessage.hashCode;
}
