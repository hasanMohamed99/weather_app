import 'package:pearogram_task/weather/data/data_source/weather_remote_date_source.dart';
import 'package:pearogram_task/weather/domain/entities/day_weather.dart';
import 'package:pearogram_task/weather/domain/entities/week_weather.dart';
import 'package:pearogram_task/weather/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;

  WeatherRepositoryImpl({required this.remoteDataSource});
  @override
  Future<DayWeather> getDayWeather(
          {required double lat, required double lon}) async =>
      await remoteDataSource.getDayWeather(lat: lat, lon: lon);

  @override
  Future<WeekWeather> getWeekWeather(
          {required double lat, required double lon}) async =>
      await remoteDataSource.getWeekWeather(lat: lat, lon: lon);

  @override
  Future<DayWeather> getDayWeatherCity({required String cityName}) async =>
      await remoteDataSource.getDayWeatherCity(cityName: cityName);
}
