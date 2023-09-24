import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pearogram_task/weather/presentation/controller/order/weather_cubit.dart';
import 'package:pearogram_task/weather/presentation/screens/home_screen.dart';
import '../../../core/utils/colors.dart';
import '../components/components.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          var cubit = WeatherCubit.get(context);
          cubit.textController.text == '' ? cubit.search.clear() : null;
          return Scaffold(
            extendBodyBehindAppBar: true,
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
              child: CustomScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.transparent,
                    leading: IconButton(
                      onPressed: () {
                        if(state is WeatherLoaded){
                          cubit.textController.clear();
                          navigateAndFinish(context, const HomeScreen());
                        }
                        else {
                          cubit.textController.clear();
                          cubit.getDayWeather();
                          navigateAndFinish(context, const HomeScreen());
                        }
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 20, left: 20, bottom: 20),
                      child: TextField(
                        autocorrect: true,
                        controller: cubit.textController,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          hintText: 'Search',
                          filled: true,
                          fillColor: AppColors.boxColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onChanged: (value) {
                          cubit.getSearch(cityName: value);
                        },
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => FadeInRight(
                        delay: const Duration(milliseconds: 200),
                        duration: const Duration(milliseconds: 800),
                        child: DayWeatherCity(
                          imagePath: cubit.getIconByTag(
                              cubit.search[index].weather![0].main.toString()),
                          status: cubit.search[index].weather![0].main,
                          degree:
                              '${(cubit.search[index].main!.temp! - 273.15).round()}\u2103',
                          cityName: cubit.search[index].name,
                        ),
                      ),
                      childCount: cubit.search.length,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
