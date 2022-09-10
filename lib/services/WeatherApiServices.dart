import 'dart:async';

import 'package:dio/dio.dart';
import 'package:test_application/models/today_weather.dart';
import '../models/hour_forcast.dart';
import '../models/local_weather_detail.dart';
import '../models/weather_info.dart';

class WeatherApiServices {
  final String weeklyForcast =
      "https://data.weather.gov.hk/weatherAPI/opendata/weather.php?dataType=fnd&lang=tc";
  final Dio _dio = Dio();

  Future<dynamic> fetchWeather() async {
    try {
      Response response = await _dio.get(weeklyForcast);
      return WeatherInfo.fromJson(response.data);
    } on DioError catch (e) {
      print(e);
    }
  }

  final String todayWeather =
      "https://api.openweathermap.org/data/2.5/weather?lat=22.27832&lon=114.17469&units=metric&lang=zh_tw&appid=e6bdc675ae146540fac2cbb08f68cc57";

  Future<dynamic> fetchTodayForcast() async {
    try {
      Response res = await _dio.get(todayWeather);
      return TodayWeather.fromJson(res.data);
    } on DioError catch (e) {
      print(e);
    }
  }

  final String hourlyForcast =
      "https://api.openweathermap.org/data/2.5/forecast?lat=22.27832&lon=114.17469&units=metric&lang=zh_tw&appid=e6bdc675ae146540fac2cbb08f68cc57&cnt=10";

  Future<dynamic> fetchHourForcast() async {
    try {
      Response res = await _dio.get(hourlyForcast);
      return HourForcast.fromJson(res.data);
    } on DioError catch (e) {
      print(e);
    }
  }

  final String localWeatherDetail =
      "https://data.weather.gov.hk/weatherAPI/opendata/weather.php?dataType=flw&lang=tc";

  Future<dynamic> fetchLocalWeatherDetail() async {
    try {
      Response res = await _dio.get(localWeatherDetail);
      return LocalWeatherDetail.fromJson(res.data);
    } on DioError catch (e) {
      print(e);
    }
  }
}
