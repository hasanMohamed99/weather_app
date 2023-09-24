import 'package:pearogram_task/weather/domain/repository/weather_repository.dart';

import '../entities/day_weather.dart';

class GetDayWeatherCityUseCase{
  final WeatherRepository repository;

  GetDayWeatherCityUseCase({required this.repository});

  Future<DayWeather> call({required String cityName}) async{
    return repository.getDayWeatherCity(cityName: cityName);
  }
}