import 'package:pearogram_task/weather/domain/entities/day_weather.dart';

class DayWeatherModel extends DayWeather {
  const DayWeatherModel({
    required super.coord,
    required super.weather,
    required super.base,
    required super.main,
    required super.visibility,
    required super.wind,
    required super.dt,
    required super.sys,
    required super.timezone,
    required super.id,
    required super.name,
    required super.cod,
  });

  factory DayWeatherModel.fromJson(Map<String, dynamic> json) {
    return DayWeatherModel(
      coord: CoordModel.fromJson(json['coord']),
      weather: List<WeatherModel>.from(
          json['weather'].map((x) => WeatherModel.fromJson(x))),
      base: json['base'],
      main: MainModel.fromJson(json['main']),
      visibility: json['visibility'],
      wind: WindModel.fromJson(json['wind']),
      dt: json['dt'],
      sys: SysModel.fromJson(json['sys']),
      timezone: json['timezone'],
      id: json['id'],
      name: json['name'],
      cod: json['cod'],
    );
  }
}

class CoordModel extends Coord {
  const CoordModel({
    required super.lon,
    required super.lat,
  });

  factory CoordModel.fromJson(Map<String, dynamic> json) {
    return CoordModel(
      lon: json['lon'],
      lat: json['lat'],
    );
  }
}

class WeatherModel extends Weather {
  const WeatherModel({
    required super.id,
    required super.main,
    required super.description,
    required super.icon,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}

class MainModel extends Main {
  const MainModel({
    required super.temp,
    required super.feelsLike,
    required super.tempMin,
    required super.tempMax,
    required super.pressure,
    required super.humidity,
    required super.seaLevel,
    required super.grndLevel,
  });
  factory MainModel.fromJson(Map<String, dynamic> json) {
    return MainModel(
      temp: json['temp'],
      feelsLike: json['feels_like'],
      tempMin: json['temp_min'],
      tempMax: json['temp_max'],
      pressure: json['pressure'],
      humidity: json['humidity'],
      seaLevel: json['sea_level'],
      grndLevel: json['grnd_level'],
    );
  }
}

class WindModel extends Wind {
  const WindModel({
    required super.speed,
    required super.deg,
    required super.gust,
  });

  factory WindModel.fromJson(Map<String, dynamic> json) {
    return WindModel(
      speed: json['speed'],
      deg: json['deg'],
      gust: json['gust'],
    );
  }
}

class SysModel extends Sys {
  const SysModel({
    required super.country,
    required super.sunrise,
    required super.sunset,
  });

  factory SysModel.fromJson(Map<String, dynamic> json) {
    return SysModel(
      country: json['country'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }
}
