import 'package:weather_app/services/weather_icons.dart';

class DaysWeather {
  final dynamic weatherData;
  final int numberInList;
  late final String timePoint;
  late final String cityName;
  late final double dayTemperature;
  late final double nightTemperature;
  late final int currentCondition;
  late final double windSpeed;
  late final String weatherIcon;
  late final String weatherMessage;

  DaysWeather({required this.weatherData, required this.numberInList}) {
    timePoint = DateTime.fromMillisecondsSinceEpoch(
            weatherData['daily'][numberInList]['dt'] * 1000)
        .toString()
        .substring(2, 10);
    dayTemperature = weatherData['daily'][numberInList]['temp']['day'];
    nightTemperature = weatherData['daily'][numberInList]['temp']['night'];
    cityName = weatherData['timezone'];
    currentCondition = weatherData['daily'][numberInList]['weather'][0]['id'];
    windSpeed = weatherData['daily'][numberInList]['wind_speed'];
    var weatherIcons = WeatherIcons();
    weatherIcon = weatherIcons.getWeatherIcon(currentCondition);
    weatherMessage = weatherIcons.getMessage(dayTemperature.toInt());
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DaysWeather &&
        other.weatherData == weatherData &&
        other.numberInList == numberInList;
  }

  @override
  int get hashCode =>
      weatherData.hashCode ^
      cityName.hashCode ^
      dayTemperature.hashCode ^
      currentCondition.hashCode ^
      windSpeed.hashCode ^
      weatherIcon.hashCode ^
      numberInList.hashCode ^
      weatherMessage.hashCode;
}
