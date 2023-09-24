import 'package:pearogram_task/weather/domain/entities/week_weather.dart';

class WeekWeatherModel extends WeekWeather {
  const WeekWeatherModel({
    required super.cod,
    required super.message,
    required super.cnt,
    required super.list,
  });

  factory WeekWeatherModel.fromJson(Map<String, dynamic> json) {
    return WeekWeatherModel(
      cod: json['cod'],
      message: json['message'],
      cnt: json['cnt'],
      list: List<WeatherDayModel>.from(
          json['list'].map((x) => WeatherDayModel.fromJson(x))),
    );
  }
}

class WeatherDayModel extends WeatherDay {
  const WeatherDayModel({
    required super.main,
    required super.weather,
    required super.pop,
    required super.dtTxt,
  });
  factory WeatherDayModel.fromJson(Map<String, dynamic> json) {
    return WeatherDayModel(
      main: MainModel.fromJson(json['main']),
      weather: List<WeatherModel>.from(
          json['weather'].map((x) => WeatherModel.fromJson(x))),
      pop: json['pop'],
      dtTxt: json['dt_txt'],
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
    required super.seaLevel,
    required super.grndLevel,
    required super.humidity,
    required super.tempKf,
  });
  factory MainModel.fromJson(Map<String, dynamic> json) {
    return MainModel(
      temp: json['temp'],
      feelsLike: json['feels_like'],
      tempMin: json['temp_min'],
      tempMax: json['temp_max'],
      pressure: json['pressure'],
      seaLevel: json['sea_level'],
      grndLevel: json['grnd_level'],
      humidity: json['humidity'],
      tempKf: json['temp_kf'],
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
