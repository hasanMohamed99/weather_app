import 'package:equatable/equatable.dart';

class DayWeather extends Equatable {
  final Coord? coord;
  final List<Weather>? weather;
  final String? base;
  final Main? main;
  final num? visibility;
  final Wind? wind;
  final num? dt;
  final Sys? sys;
  final num? timezone;
  final num? id;
  final String? name;
  final num? cod;

  const DayWeather({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  @override
  List<Object?> get props => [
        coord,
        weather,
        main,
        visibility,
        wind,
        dt,
        sys,
        timezone,
        id,
        name,
        cod,
      ];
}

class Coord extends Equatable {
  final num? lon;
  final num? lat;

  const Coord({
    required this.lon,
    required this.lat,
  });

  @override
  List<Object?> get props => [
        lon,
        lat,
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

class Main extends Equatable {
  final num? temp;
  final num? feelsLike;
  final num? tempMin;
  final num? tempMax;
  final num? pressure;
  final num? humidity;
  final num? seaLevel;
  final num? grndLevel;

  const Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  });

  @override
  List<Object?> get props => [
        temp,
        feelsLike,
        tempMin,
        tempMax,
        pressure,
        humidity,
        seaLevel,
        grndLevel,
      ];
}

class Wind extends Equatable {
  final num? speed;
  final num? deg;
  final num? gust;

  const Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  @override
  List<Object?> get props => [
        speed,
        deg,
        gust,
      ];
}

class Sys extends Equatable {
  final String? country;
  final num? sunrise;
  final num? sunset;

  const Sys({
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  @override
  List<Object?> get props => [
        country,
        sunrise,
        sunset,
      ];
}
