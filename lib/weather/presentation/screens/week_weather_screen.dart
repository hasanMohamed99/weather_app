import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pearogram_task/generated/assets.dart';

import '../../../core/utils/colors.dart';
import '../../domain/entities/week_weather.dart';
import '../components/components.dart';
import '../controller/order/weather_cubit.dart';
import '../widgets/weather_day_card.dart';

class WeekWeatherScreen extends StatelessWidget {
  const WeekWeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoaded) {
            var cubit = WeatherCubit.get(context);
            List<WeatherDay> weekDaysWeather = [];
            state.weekWeather.list?.forEach((element) {
              element.dtTxt?.substring(11, element.dtTxt?.length) == '00:00:00'
                  ? weekDaysWeather.add(element)
                  : null;
            });
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  leading: IconButton(
                      onPressed: () {
                        cubit.movePageBack();
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  centerTitle: true,
                  title: FadeInDown(
                    delay: const Duration(milliseconds: 200),
                    duration: const Duration(milliseconds: 800),
                    child: const Text(
                      '7 Days',
                      style: TextStyle(color: AppColors.textMainColor),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: FadeInDown(
                    delay: const Duration(milliseconds: 200),
                    duration: const Duration(milliseconds: 800),
                    child: const WeatherDayCard(),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: weekDaysWeather.length,
                    (context, index) => FadeInUp(
                      delay: const Duration(milliseconds: 200),
                      duration: const Duration(milliseconds: 800),
                      child: DayWeatherItem(
                        imagePath: cubit.getIconByTag(
                            weekDaysWeather[index].weather![0].main.toString()),
                        day: cubit.getDayFromDate(
                            date:
                                weekDaysWeather[index].dtTxt!.substring(0, 10)),
                        status: weekDaysWeather[index].weather![0].main,
                        minDegree:
                            '+${(weekDaysWeather[index].main!.tempMax! - 273.15).round()}°',
                        maxDegree:
                            '+${(weekDaysWeather[index].main!.tempMin! - 273.15).round()}°',
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CustomCircularProgress());
          }
        },
      ),
    );
  }
}
