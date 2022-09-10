import 'dart:async';

import 'package:flutter/material.dart';

import 'components/current_weather.dart';
import 'components/weekly_weather.dart';
import 'services/WeatherApiServices.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool _isLoading = true;
  bool _visible = false;
  dynamic todayForcast;
  dynamic hourlyForcast;
  dynamic weeklyForcast;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future _fetchData() async {
    setState(() {
      _isLoading = true;
    });

    final res = await Future.wait([
      WeatherApiServices().fetchTodayForcast(),
      WeatherApiServices().fetchHourForcast(),
      WeatherApiServices().fetchWeather(),
      Future<dynamic>.delayed(const Duration(seconds: 1), () {})
    ]);
    setState(() {
      todayForcast = res[0];
      hourlyForcast = res[1];
      weeklyForcast = res[2];
    });
    setState(() {
      _isLoading = false;
      Timer(const Duration(milliseconds: 100), () {
        setState(() {
          _visible = !_visible;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Container(
              color: Colors.black.withOpacity(0.95),
              child: const Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white)),
              ),
            )
          : Container(
              color: Colors.black.withOpacity(0.95),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              child: SafeArea(
                  child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 800),
                      opacity: _visible ? 1.0 : 0.0,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: const Text(
                                " 天氣",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 36,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            CurrentWeather(todayForcast, hourlyForcast),
                            const SizedBox(height: 15),
                            WeeklyWeather(weeklyForcast),
                            // FloatingActionButton(onPressed: () {
                            //   setState(() {
                            //   });
                            // })
                          ])))),
    );
  }
}
