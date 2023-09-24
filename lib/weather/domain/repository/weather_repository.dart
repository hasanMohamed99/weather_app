import '../entities/day_weather.dart';
import '../entities/week_weather.dart';

abstract class WeatherRepository{
  Future<DayWeather> getDayWeather({required double lat, required double lon});
  Future<WeekWeather> getWeekWeather({required double lat, required double lon});
  Future<DayWeather> getDayWeatherCity({required String cityName});
}