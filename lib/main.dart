import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
  theme: ThemeData(
    primarySwatch: getconditionColor(
      BlocProvider.of<GetWeatherCubit>(context)
          .weatherModel
          ?.condition,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: getconditionColor(
        BlocProvider.of<GetWeatherCubit>(context)
            .weatherModel
            ?.condition,
      ), // force AppBar color
    ),
  ),
  home: const HomeView(),
);

          },
        ),
      ),
    );
  }
}

MaterialColor getconditionColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }

  final cond = condition.toLowerCase();

  if (cond.contains("sun") || cond.contains("clear")) {
    return Colors.orange;
  } else if (cond.contains("cloud")) {
    return Colors.blueGrey;
  } else if (cond.contains("rain") || cond.contains("drizzle")) {
    return Colors.indigo;
  } else if (cond.contains("snow")) {
    return Colors.lightBlue;
  } else if (cond.contains("thunder") || cond.contains("storm")) {
    return Colors.deepPurple;
  } else if (cond.contains("mist") ||
      cond.contains("fog") ||
      cond.contains("haze")) {
    return Colors.grey;
  } else {
    return Colors.blue; // default fallback
  }
}
