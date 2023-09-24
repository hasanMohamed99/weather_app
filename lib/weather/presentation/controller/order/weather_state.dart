part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  @override
  List<Object> get props => [];
}

class ChangeBottomNavState extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoading extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoaded extends WeatherState {
  final DayWeather dayWeather;
  final WeekWeather weekWeather;

  const WeatherLoaded({required this.weekWeather, required this.dayWeather});
  @override
  List<Object> get props => [];
}

class WeatherFailure extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherGetSearchLoadingState extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherGetSearchLoadedState extends WeatherState {
  final DayWeather cityDayWeather;

  const WeatherGetSearchLoadedState({ required this.cityDayWeather});
  @override
  List<Object> get props => [];
}

class WeatherGetSearchWeatherFailure extends WeatherState {
  @override
  List<Object> get props => [];
}

class AppIsConnectedState extends WeatherState {
  @override
  List<Object> get props => [];
}

class AppIsNotConnectedState extends WeatherState {
  @override
  List<Object> get props => [];
}
