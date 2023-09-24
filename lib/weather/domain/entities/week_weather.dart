import 'package:equatable/equatable.dart';

class WeekWeather extends Equatable {
  final String? cod;
  final num? message;
  final num? cnt;
  final List<WeatherDay>? list;

  const WeekWeather({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
  });

  @override
  List<Object?> get props => [
        cod,
        message,
        cnt,
        list,
      ];
}

class WeatherDay extends Equatable {
  final Main? main;
  final List<Weather>? weather;
  final num? pop;
  final String? dtTxt;

  const WeatherDay({
    required this.main,
    required this.weather,
    required this.pop,
    required this.dtTxt,
  });

  @override
  List<Object?> get props => [
        main,
        weather,
        pop,
        dtTxt,
      ];
}

class Main extends Equatable {
  final num? temp;
  final num? feelsLike;
  final num? tempMin;
  final num? tempMax;
  final num? pressure;
  final num? seaLevel;
  final num? grndLevel;
  final num? humidity;
  final num? tempKf;

  const Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf,
  });

  @override
  List<Object?> get props => [
        temp,
        feelsLike,
        tempMin,
        tempMax,
        pressure,
        seaLevel,
        grndLevel,
        humidity,
        tempKf,
      ];
}

class Weather extends Equatable {
  final num? id;
  final String? main;
  final String? description;
  final String? icon;

  const Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  @override
  List<Object?> get props => [
        id,
        main,
        description,
        icon,
      ];
}
