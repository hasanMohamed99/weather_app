import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pearogram_task/generated/assets.dart';
import 'package:pearogram_task/weather/domain/entities/week_weather.dart';

import '../components/components.dart';
import '../controller/order/weather_cubit.dart';

class WeatherDayDegrees extends StatelessWidget {
  const WeatherDayDegrees({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoaded) {
            var cubit = WeatherCubit.get(context);
            List<WeatherDay> todayWeather = [];
            state.weekWeather.list?.forEach((element) {
              element.dtTxt?.substring(0, 10) ==
                      DateFormat('yyyy-MM-dd').format(DateTime.now())
                  ? todayWeather.add(element)
                  : null;
            });
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => DayWeatherCard(
                time: '${todayWeather[index].dtTxt?.substring(11,16)}',
                imagePath: cubit.getIconByTag('${todayWeather[index].weather?[0].main}'),
                degree: '${(todayWeather[index].main!.temp! - 273.15).round()}°',
              ),
              itemCount: todayWeather.length,
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
