import 'package:flutter/material.dart';
import '../../../core/utils/colors.dart';
import '../controller/order/weather_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = WeatherCubit.get(context);
        return Scaffold(
          extendBody: true,
          body: Container(
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.firstBackgroundColor,
                  AppColors.secondBackgroundColor,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: PageView(
              controller: cubit.pageController,
              scrollDirection: Axis.horizontal,
              children: cubit.screens,
            ),
          ),
        );
      },
    );
  }
}
