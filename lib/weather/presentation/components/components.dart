import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pearogram_task/core/utils/colors.dart';
import 'package:pearogram_task/core/utils/styles.dart';
import 'package:pearogram_task/generated/assets.dart';

class WeatherCardItem extends StatelessWidget {
  final String? imagePath;
  final String? value;
  final String? label;
  const WeatherCardItem(
      {super.key, required this.imagePath, this.value, this.label});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath!,
            width: MediaQuery.sizeOf(context).width * .1,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            value!,
            style: const TextStyle(
                fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            label!,
            style: const TextStyle(
                fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}

class DayWeatherCard extends StatelessWidget {
  final String? time;
  final String? imagePath;
  final String? degree;
  const DayWeatherCard({super.key, this.time, this.imagePath, this.degree});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 120,
      child: FittedBox(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          color: const Color(0xff957DCD).withOpacity(0.5),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  time!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                ),
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  imagePath!,
                  width: MediaQuery.sizeOf(context).width * .1,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  degree!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DayWeatherItem extends StatelessWidget {
  final String? day;
  final String? imagePath;
  final String? status;
  final String? maxDegree;
  final String? minDegree;
  const DayWeatherItem({
    super.key,
    this.day,
    this.imagePath,
    this.status,
    this.maxDegree,
    this.minDegree,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            day!,
            style: const TextStyle(
                fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
          ),
          Row(
            children: [
              Image.asset(
                imagePath!,
                width: MediaQuery.sizeOf(context).width * .15,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                status!,
                style: Styles.textStyle16(AppColors.textMainColor, context),
              ),
            ],
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '${minDegree!}   ',
                  style: Styles.textStyle14(AppColors.textMainColor, context),
                ),
                TextSpan(
                  text: maxDegree!,
                  style: Styles.textStyle14(AppColors.textMainColor, context),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCircularProgress extends StatelessWidget {
  const CustomCircularProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(Assets.imagesAnimationLoading);
  }
}

class DayWeatherCity extends StatelessWidget {
  final String? cityName;
  final String? status;
  final String? imagePath;
  final String? degree;
  const DayWeatherCity({
    super.key,
    required this.imagePath,
    required this.status,
    required this.degree,
    required this.cityName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: const Color(0xff957DCD).withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: cityName,
                    style: Styles.textStyleBold20(
                        AppColors.textMainColor, context),
                  ),
                  TextSpan(
                    text: '\n\n$status',
                    style: Styles.textStyle14(AppColors.textMainColor, context),
                  ),
                ]),
              ),
              Text(
                degree!,
                style: Styles.textStyleBold34(AppColors.textMainColor, context),
              ),
              Image.asset(
                imagePath!,
                width: MediaQuery.sizeOf(context).width * .3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void navigateTo(context, Widget widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

void navigateAndFinish(context, Widget widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
      (Route<dynamic> route) => false,
);
