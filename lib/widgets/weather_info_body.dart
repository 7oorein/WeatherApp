import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key, required this.weather}) : super(key: key);
  
final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          getconditionColor(weatherModel.condition),
          getconditionColor(weatherModel.condition)[300]!,
          getconditionColor(weatherModel.condition)[50]!,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        
        ),
        
        
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              weatherModel.cityName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text(
             "updated at ${weatherModel.time.hour}:${weatherModel.time.minute}",
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                Image.network(
                  weatherModel.image!.startsWith('http')
                      ? weatherModel.image!
                      : 'https:${weatherModel.image!}',
                  width: 64,
                  height: 64,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error, size: 40, color: Colors.red);
                  },
                ),
      
      
                 Text(
                  '${weatherModel.avgTemp.toString()}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                 Column(
                  children: [
                    Text(
                      'Max temp: ${weatherModel.maxTemp.round()}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
      
                    Text(
                      'Mintemp: ${weatherModel.minTemp.round()}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
             Text(
              weatherModel.condition,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


