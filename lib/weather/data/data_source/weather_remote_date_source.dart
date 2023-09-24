import '../../domain/entities/day_weather.dart';
import '../../domain/entities/week_weather.dart';

abstract class WeatherRemoteDataSource{
  Future<DayWeather> getDayWeather({required double lat, required double lon});
  Future<WeekWeather> getWeekWeather({required double lat, required double lon});
  Future<DayWeather> getDayWeatherCity({required String cityName});
}