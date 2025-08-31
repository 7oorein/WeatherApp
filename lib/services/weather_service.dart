import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {

final Dio dio ;

  WeatherService(this.dio);

Future<WeatherModel> getCurrentWeather({required String cityName}) async{
  try {
  Response response = await Dio().get('http://api.weatherapi.com/v1/forecast.json?key=b82840d7d2254573b7424746252408&q=$cityName&days=1');
  
  WeatherModel weatherModel = WeatherModel.fromJson(response.data);
  
  
  return weatherModel;
} on DioException catch (e) {
  final String errorMessage = e.response?.data['error']['message'] ?? 'oops there was an error, try later';
  throw Exception(errorMessage);
}
catch (e){
  throw Exception('oops there was an error, try later');
}
}



}