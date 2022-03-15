class Weather {
  final String cityName;
  final double temperature;
  final String weatherIcon;
  final String weatherMessage;

  Weather(
      {required this.cityName,
      required this.temperature,
      required this.weatherIcon,
      required this.weatherMessage});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Weather &&
        other.cityName == cityName &&
        other.temperature == temperature &&
        other.weatherIcon == weatherIcon &&
        other.weatherMessage == weatherMessage;
  }

  @override
  int get hashCode =>
      cityName.hashCode ^
      temperature.hashCode ^
      weatherIcon.hashCode ^
      weatherMessage.hashCode;
}
