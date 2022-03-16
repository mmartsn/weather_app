part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {
  const WeatherInitial();
  @override
  List<Object> get props => [];
}

class WeatherLoading extends WeatherState {
  const WeatherLoading();
  @override
  List<Object> get props => [];
}

class WeatherLoaded extends WeatherState {
  final weatherData;
  const WeatherLoaded(this.weatherData);

  @override
  List<Object> get props => [weatherData];
}

class WeatherError extends WeatherState {
  final String message;
  const WeatherError(this.message);

  @override
  List<Object> get props => [message];
}
