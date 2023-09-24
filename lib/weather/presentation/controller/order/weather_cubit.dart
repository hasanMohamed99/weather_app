import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:pearogram_task/generated/assets.dart';
import 'package:pearogram_task/weather/domain/entities/day_weather.dart';
import 'package:pearogram_task/weather/domain/entities/week_weather.dart';
import 'package:pearogram_task/weather/domain/use_cases/get_day_weather_usecase.dart';
import 'package:pearogram_task/weather/presentation/screens/weather_details_screen.dart';
import 'package:pearogram_task/weather/presentation/screens/week_weather_screen.dart';
import '../../../domain/use_cases/get_day_weather_city_usecase.dart';
import '../../../domain/use_cases/get_week_weather_usecase.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final GetDayWeatherUseCase getDayWeatherUseCase;
  final GetWeekWeatherUseCase getWeekWeatherUseCase;
  final GetDayWeatherCityUseCase getDayWeatherCityUseCase;
  WeatherCubit({
    required this.getDayWeatherCityUseCase,
    required this.getWeekWeatherUseCase,
    required this.getDayWeatherUseCase,
  }) : super(WeatherInitial());

  static WeatherCubit get(context) => BlocProvider.of(context);

  final pageController = PageController(initialPage: 0);
  final textController = TextEditingController();

  List<Widget> screens = [
    const WeatherDetailsScreen(),
    const WeekWeatherScreen(),
  ];
  void movePageForward() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
  void movePageBack() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  Future<void> getDayWeather() async {
    var position = await _determinePosition();
    emit(WeatherLoading());
    try {
      final getDayWeather =
          await getDayWeatherUseCase.call(lat: position.lat, lon: position.lon);
      final getWeekWeather = await getWeekWeatherUseCase.call(
          lat: position.lat, lon: position.lon);
      emit(WeatherLoaded(
        dayWeather: getDayWeather,
        weekWeather: getWeekWeather,
      ));
    } on SocketException catch (_) {
      emit(WeatherFailure());
    } catch (_) {
      emit(WeatherFailure());
    }
  }

  String getIconByTag(String tag) {
    switch (tag) {
      case 'Thunderstorm':
        return Assets.imagesThunderIcon;
      case 'Drizzle' || 'Rain':
        return Assets.imagesRainIcon;
      case 'Snow':
        return Assets.imagesSnowIcon;
      case 'Mist' ||
            'Smoke' ||
            'Haze' ||
            'Dust' ||
            'Fog' ||
            'Sand' ||
            'Dust' ||
            'Ash' ||
            'Squall' ||
            'Tornado':
        return Assets.imagesStormIcon;
      case 'Clear':
        return Assets.imagesSunnyIcon;
      case 'Clouds':
        return Assets.imagesCloudyIcon;
      default:
        return Assets.imagesSunnyCloudyIcon;
    }
  }

  Future<({double lat, double lon})> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {}

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    } else if (permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    } else if (permission == LocationPermission.unableToDetermine) {
      permission = await Geolocator.requestPermission();
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return (lat: position.latitude, lon: position.longitude);
  }

  String getDayFromDate({required String date}) {
    return DateFormat('EEEE').format(DateTime.utc(
        int.parse(date.substring(0, 4)),
        int.parse(date.substring(5, 7)),
        int.parse(date.substring(8, 10))));
  }
  List<DayWeather> search = [];
  Future<void> getSearch({required String cityName}) async{
    emit(WeatherGetSearchLoadingState());
    try {
      final getWeatherSearchedCity =
          await getDayWeatherCityUseCase.call(cityName: cityName);
      search =[getWeatherSearchedCity];
      emit(WeatherGetSearchLoadedState(
        cityDayWeather: getWeatherSearchedCity,
      ));
    } on SocketException catch (_) {
      emit(WeatherGetSearchWeatherFailure());
    } catch (_) {
      emit(WeatherGetSearchWeatherFailure());
    }
  }
}
