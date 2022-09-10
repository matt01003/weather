import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';
import '../services/WeatherApiServices.dart';
import 'local_weather_dialog.dart';

const _weekDayZh = {
  "Monday": "星期一",
  "Tuesday": "星期二",
  "Wednesday": "星期三",
  "Thursday": "星期四",
  "Friday": "星期五",
  "Saturday": "星期六",
  "Sunday": "星期日",
};

class CurrentWeather extends StatefulWidget {
  final dynamic todayForcast;
  final dynamic hourlyForcast;

  const CurrentWeather(
    this.todayForcast,
    this.hourlyForcast, {
    Key? key,
  }) : super(key: key);

  @override
  State<CurrentWeather> createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
  late DateTime date = DateTime.now();
  late Future<dynamic> todayWeather;

  @override
  void initState() {
    super.initState();
    todayWeather = WeatherApiServices().fetchTodayForcast();

    Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        date = DateTime.now();
      });
    });
  }

  _showfetchLocalWeatherDialog() {
    showDialog(
        context: context,
        builder: (_) {
          bool time = false;
          return FutureBuilder<dynamic>(
              future: Future<dynamic>.delayed(const Duration(seconds: 1), () {
                return WeatherApiServices().fetchLocalWeatherDetail();
              }),
              builder: ((context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white)),
                  );
                } else {
                  return LocalWeatherDialog(snapshot.data);
                }
              }));
        });
  }

  @override
  Widget build(BuildContext context) {
    var temp = widget.todayForcast.main;
    var weather = widget.todayForcast.weather[0];
    var hourlyForcastData = widget.hourlyForcast.list;
    return Container(
      decoration: greyBox,
      padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              "${date.month}月${date.day}日 - ${_weekDayZh[DateFormat('EEEE').format(date)]}  ${DateFormat('Hms').format(date)} ",
              style: greyText15),
          // Current weather
          Container(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/openweathermap/${weather.icon}.svg',
                      width: 80,
                      height: 80,
                    ),
                    Text(
                      "${formatTemp(temp.temp)}\u00B0",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 58,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(weather.description, style: greyText15),
                    const SizedBox(height: 4),
                    Text(
                        "${formatTemp(temp.tempMin)}\u00B0 / ${formatTemp(temp.tempMax)}\u00B0",
                        style: greyText15),
                    const SizedBox(height: 2),
                    Text("體感溫度 ${formatTemp(temp.feelsLike)}\u00B0",
                        style: greyText15),
                    const SizedBox(height: 5),
                  ],
                )
              ],
            ),
          ),

          // Hourly forcast
          Container(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(5,
                  (index) => hourlyForcastDetail(hourlyForcastData[index + 3])),
            ),
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.grey[350],
                primary: Colors.grey[800],
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              ),
              onPressed: () {
                _showfetchLocalWeatherDialog();
              },
              child: const Text('更多', style: TextStyle(fontSize: 15)),
            ),
          ),
        ],
      ),
    );
  }
}

String formatTemp(temp) => temp.round().toString();

Column hourlyForcastDetail(data) {
  return Column(
    children: [
      Text(data.dtTxt.substring(11, 16), style: greyText16),
      Container(
        transform: Matrix4.translationValues(0, -6, 0),
        child: SvgPicture.asset(
          'assets/openweathermap/${data.weather[0].icon}.svg',
          width: 60,
          height: 60,
        ),
      ),
      Container(
        transform: Matrix4.translationValues(0, -10, 0),
        child: Text("${data.main.temp.round()}\u00B0", style: tempText),
      ),
    ],
  );
}
