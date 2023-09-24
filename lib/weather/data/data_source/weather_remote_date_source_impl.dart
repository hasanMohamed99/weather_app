import 'package:pearogram_task/core/services/dio_helper.dart';
import 'package:pearogram_task/weather/data/data_source/weather_remote_date_source.dart';
import 'package:pearogram_task/weather/data/models/day_weather_model.dart';
import 'package:pearogram_task/weather/domain/entities/day_weather.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/network/api_constance.dart';
import '../../../core/network/error_message_model.dart';
import '../../domain/entities/week_weather.dart';
import '../models/week_weather_model.dart';

class WeatherRemoteDataSourceImpl extends WeatherRemoteDataSource{
  @override
  Future<DayWeatherModel> getDayWeather({required double lat, required double lon}) async{
    final response = await DioHelper.getData(baseUrl: ApiConstance.baseUrl,url: ApiConstance.weatherDayPath(lat: lat, lon: lon));
    if(response.statusCode == 200){
      return DayWeatherModel.fromJson(response.data);
    }else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<WeekWeather> getWeekWeather({required double lat, required double lon}) async {
    final response = await DioHelper.getData(baseUrl: ApiConstance.baseUrl,url: ApiConstance.weatherWeekPath(lat: lat, lon: lon));
    if(response.statusCode == 200){
      return WeekWeatherModel.fromJson(response.data);
    }else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<DayWeather> getDayWeatherCity({required String cityName}) async{
    final response = await DioHelper.getData(baseUrl: ApiConstance.baseUrl,url: ApiConstance.weatherDayCityPath(cityName: cityName));
    if(response.statusCode == 200){
      return DayWeatherModel.fromJson(response.data);
    }else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}