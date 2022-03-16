import 'package:weather_app/services/weather_icons.dart';

class HoursWeather {
  final dynamic weatherData;
  final int numberInList;
  late final String timePoint;
  late final String cityName;
  late final double currentTemperature;
  late final int currentCondition;
  late final String weatherIcon;
  late final String weatherMessage;

  HoursWeather({required this.weatherData, required this.numberInList}) {
    timePoint = DateTime.fromMillisecondsSinceEpoch(
            weatherData['hourly'][numberInList]['dt'] * 1000)
        .toString()
        .substring(11, 16);
    currentTemperature = weatherData['hourly'][numberInList]['temp'];
    cityName = weatherData['timezone'];
    currentCondition = weatherData['hourly'][numberInList]['weather'][0]['id'];
    var weatherIcons = WeatherIcons();
    weatherIcon = weatherIcons.getWeatherIcon(currentCondition);
    weatherMessage = weatherIcons.getMessage(currentTemperature.toInt());
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HoursWeather &&
        other.weatherData == weatherData &&
        other.numberInList == numberInList;
  }

  @override
  int get hashCode =>
      weatherData.hashCode ^
      cityName.hashCode ^
      currentTemperature.hashCode ^
      currentCondition.hashCode ^
      weatherIcon.hashCode ^
      numberInList.hashCode ^
      weatherMessage.hashCode;
}
