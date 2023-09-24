import 'package:get_it/get_it.dart';
import 'package:pearogram_task/weather/domain/repository/weather_repository.dart';
import 'package:pearogram_task/weather/domain/use_cases/get_day_weather_usecase.dart';
import 'package:pearogram_task/weather/presentation/controller/order/weather_cubit.dart';

import '../../weather/data/data_source/weather_remote_date_source.dart';
import '../../weather/data/data_source/weather_remote_date_source_impl.dart';
import '../../weather/data/repository/weather_repository_impl.dart';
import '../../weather/domain/use_cases/get_day_weather_city_usecase.dart';
import '../../weather/domain/use_cases/get_week_weather_usecase.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  /// Bloc
  sl.registerFactory<WeatherCubit>(
    () => WeatherCubit(
      getDayWeatherUseCase: sl.call(),
      getWeekWeatherUseCase: sl.call(),
      getDayWeatherCityUseCase: sl.call(),
    ),
  );

  /// Use Cases
  sl.registerLazySingleton<GetDayWeatherUseCase>(
      () => GetDayWeatherUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetWeekWeatherUseCase>(
      () => GetWeekWeatherUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetDayWeatherCityUseCase>(
      () => GetDayWeatherCityUseCase(repository: sl.call()));

  /// Repository
  sl.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(remoteDataSource: sl.call()));

  /// Data Source
  sl.registerLazySingleton<WeatherRemoteDataSource>(
      () => WeatherRemoteDataSourceImpl());
}
