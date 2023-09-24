import 'package:dio/dio.dart';
import 'package:pearogram_task/core/network/api_constance.dart';

class DioHelper
{
  static late Dio dio;

  static init(){
  }
  static Future<Response> getData({
    required String baseUrl,
    required String url,
    Map<String,dynamic>? query,
  }) async
  {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
    return await dio.get(
      url,
      queryParameters: query,
    );
  }
}