import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pearogram_task/core/utils/app_strings.dart';
import 'package:pearogram_task/core/utils/colors.dart';
import 'package:pearogram_task/core/utils/styles.dart';
import '../../../generated/assets.dart';
import '../components/components.dart';
import '../controller/order/weather_cubit.dart';

class WeatherDetailsWidget extends StatelessWidget {
  const WeatherDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          var cubit = WeatherCubit.get(context);
          if(state is WeatherLoaded){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state.dayWeather.weather?[0].description??'/',
                  style: Styles.textStyle16(AppColors.textMainColor, context),
                ),
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  cubit.getIconByTag(state.dayWeather.weather?[0].main??'/'),
                  width: MediaQuery
                      .sizeOf(context)
                      .width / 2,
                  height: 120,
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  '${(state.dayWeather.main!.temp! - 273.15).round()} \u2103',
                  style: Styles.textStyleBold56(AppColors.textMainColor, context),
                ),
                const SizedBox(
                  height: 14,
                ),
                Text(
                  DateFormat('EEEE, d MMM, yyyy').format(DateTime.now()),
                  style: Styles.textStyleBold16(AppColors.textMainColor, context),
                ),
                const SizedBox(
                  height: 14,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width *.13),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    color: const Color(0xff957DCD).withOpacity(0.5),
                    child: Row(
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
                  ),
                ),
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
