class WeatherModel {
  final String cityName;
  final DateTime time;
  final String? image;
  final double avgTemp;
  final double minTemp;
  final double maxTemp;
  final String condition;

  WeatherModel(
      {required this.cityName,
      required this.time,
       this.image,
      required this.avgTemp,
      required this.minTemp,
      required this.maxTemp,
      required this.condition});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
        cityName: json['location']['name'],
        time: DateTime.parse(json['current']['last_updated']),
        avgTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'] ,
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'] ,
        maxTemp:  json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        condition:  json['forecast']['forecastday'][0]['day']['condition']['text']
        );
  }
}
