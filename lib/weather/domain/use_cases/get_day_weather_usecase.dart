import 'package:pearogram_task/weather/domain/repository/weather_repository.dart';

import '../entities/day_weather.dart';

class GetDayWeatherUseCase{
  final WeatherRepository repository;

  GetDayWeatherUseCase({required this.repository});

  Future<DayWeather> call({required double lat, required double lon}) async{
    return repository.getDayWeather(lat: lat, lon: lon);
  }
}