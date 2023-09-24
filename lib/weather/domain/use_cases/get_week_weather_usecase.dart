import 'package:pearogram_task/weather/domain/repository/weather_repository.dart';
import '../entities/week_weather.dart';

class GetWeekWeatherUseCase{
  final WeatherRepository repository;

  GetWeekWeatherUseCase({required this.repository});

  Future<WeekWeather> call({required double lat, required double lon}) async{
    return repository.getWeekWeather(lat: lat, lon: lon);
  }
}