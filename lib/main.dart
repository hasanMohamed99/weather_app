import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pearogram_task/weather/presentation/controller/order/weather_cubit.dart';
import 'package:pearogram_task/weather/presentation/screens/home_screen.dart';
import 'core/services/dio_helper.dart';
import 'core/services/services_locator.dart' as service;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
    ),
  );
  DioHelper.init();
  await service.init();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => service.sl<WeatherCubit>()..getDayWeather(),
      child: BlocConsumer<WeatherCubit, WeatherState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            theme: ThemeData.dark(),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}