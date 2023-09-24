import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pearogram_task/core/utils/colors.dart';

import '../../../core/utils/app_strings.dart';
import '../../../core/utils/styles.dart';
import '../../../generated/assets.dart';
import '../components/components.dart';
import '../controller/order/weather_cubit.dart';

class WeatherDayCard extends StatelessWidget {
  const WeatherDayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        color: const Color(0xff957DCD).withOpacity(0.5),
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if(state is WeatherLoaded){
              var cubit = WeatherCubit.get(context);
              return Column(
                children: [
                  FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          cubit.getIconByTag(state.dayWeather.weather?[0].main??'/'),
                          width: MediaQuery
                              .sizeOf(context)
                              .width * .45,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                alignment: PlaceholderAlignment.bottom,
                                child: Text(
                                  '${(state.dayWeather.main!.tempMax! - 273.15).round()}°',
                                  style: Styles.textStyleBold34(
                                      AppColors.textMainColor, context),
                                ),
                              ),
                              WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: Text(
                                  '/',
                                  style: Styles.textStyleBold56(
                                      AppColors.textMainColor, context),
                                ),
                              ),
                              WidgetSpan(
                                alignment: PlaceholderAlignment.top,
                                child: Text(
                                  '${(state.dayWeather.main!.tempMin! - 273.15).round()}°',
                                  style: Styles.textStyleBold20(
                                      AppColors.textMainColor, context),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      WeatherCardItem(
                        imagePath: Assets.imagesHumidityIcon,
                        value: '${state.dayWeather.main?.humidity} %',
                        label: AppString.mainStrings.humidity,
                      ),
                      WeatherCardItem(
                        imagePath: Assets.imagesWindSpeedIcon,
                        value: '${(state.dayWeather.wind!.speed! * 3.6).round()} km/h',
                        label: AppString.mainStrings.windSpeed,
                      ),
                    ],
                  ),
                ],
              );
            }
            else {
              return const SizedBox();
            }

          },
        ),
      ),
    );
  }
}
