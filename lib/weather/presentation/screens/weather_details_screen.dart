import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pearogram_task/weather/presentation/screens/search_screen.dart';
import '../../../core/utils/colors.dart';
import '../components/components.dart';
import '../controller/order/weather_cubit.dart';
import '../widgets/weather_day_degrees.dart';
import '../widgets/weather_details_widget.dart';

class WeatherDetailsScreen extends StatelessWidget {
  const WeatherDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoaded) {
            var cubit = WeatherCubit.get(context);
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  leading: IconButton(onPressed: (){navigateTo(context, const SearchScreen());}, icon: const Icon(Icons.search)),
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  centerTitle: true,
                  title: FadeInDown(
                    delay: const Duration(milliseconds: 200),
                    duration: const Duration(milliseconds: 800),
                    child: Text(
                      state.dayWeather.name ?? '/',
                      style: const TextStyle(color: AppColors.textMainColor),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: FadeInDown(
                    delay: const Duration(milliseconds: 200),
                    duration: const Duration(milliseconds: 800),
                    child: const WeatherDetailsWidget(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: FadeInUp(
                    delay: const Duration(milliseconds: 200),
                    duration: const Duration(milliseconds: 800),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Today',
                              ),
                              TextButton(
                                  onPressed: () {
                                    cubit.movePageForward();
                                  },
                                  child: const Row(
                                    children: [
                                      Text('5 Day Forecasts'),
                                      Icon(Icons.arrow_forward_ios),
                                    ],
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: FadeInUp(
                    delay: const Duration(milliseconds: 200),
                    duration: const Duration(milliseconds: 800),
                    child: const WeatherDayDegrees(),
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
