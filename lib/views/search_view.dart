import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Search a City"),
        //backgroundColor: Colors.orange,
        
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value) async{
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: const  InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              border: OutlineInputBorder(
                //borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.orange)
              ),
              hintText: 'Enter a City',
              suffixIcon: Icon(Icons.search),
              labelText: 'Search',
            //     enabledBorder: OutlineInputBorder(
            //        borderRadius: BorderRadius.circular(16),
            //     borderSide: BorderSide(color: Colors.orange)
            //     ),
            //     focusedBorder: 
            //     OutlineInputBorder(
            //        borderRadius: BorderRadius.circular(16),
            //     borderSide: BorderSide(color: Colors.orange)
            // ),
          ),
        ),
      ),
      ),
    );
  }
}

