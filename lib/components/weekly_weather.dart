import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class WeeklyWeather extends StatefulWidget {
  final dynamic weeklyForcast;
  const WeeklyWeather(this.weeklyForcast, {Key? key}) : super(key: key);

  @override
  State<WeeklyWeather> createState() => _WeeklyWeatherState();
}

class _WeeklyWeatherState extends State<WeeklyWeather> {
  @override
  Widget build(BuildContext context) {
    var data = widget.weeklyForcast.weatherForecast;
    return Expanded(
        child: Container(
      padding: const EdgeInsets.all(20),
      decoration: greyBox,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(height: 10);
        },
        itemCount: data.length,
        itemBuilder: ((context, index) {
          return weatherDetail(data[index]);
        }),
      ),
    ));
  }
}

// Icon code from HKO
String? getWeatherIcon(num forecastIcon) {
  const weatherIcon = {
    // sun
    '50': 'assets/clear-day.svg',
    '51': 'assets/partly-cloudy-day.svg',
    '52': 'assets/partly-cloudy-day-haze.svg',
    '53': 'assets/partly-cloudy-day-rain.svg',
    '54': 'assets/partly-cloudy-day-rain.svg',
    '90': 'assets/clear-day.svg',
    '91': 'assets/clear-day.svg',
    // rain
    '60': 'assets/cloudy.svg',
    '61': 'assets/cloudy2.svg',
    '62': 'assets/rain.svg',
    '63': 'assets/wi_rain.svg',
    '64': 'assets/wi_rain.svg',
    '65': 'assets/wi_thunderstorms-day-rain.svg',
    // special
    '80': 'assets/wind.svg',
    '81': 'assets/dust-wind.svg',
    '82': 'assets/raindrops.svg',
    '83': 'assets/haze.svg',
    '84': 'assets/haze.svg',
    '85': 'assets/fog-day.svg',
  };

  return weatherIcon[forecastIcon.toString()];
}

Row weatherDetail(data) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Text(data.week, style: whiteText18),
          const SizedBox(width: 10),
          _weatherSmallIcon(getWeatherIcon(data.forecastIcon).toString()),
        ],
      ),
      Row(
        children: [
          SizedBox(width: 38, child: Text(data.pSR, style: whiteText18)),
          _weatherSmallIcon(data.pSR == "低"
              ? 'assets/raindrop1.svg'
              : data.pSR == "中低" || data.pSR == "中"
                  ? 'assets/raindrop2.svg'
                  : 'assets/raindrop3.svg'),
        ],
      ),
      SizedBox(
        width: 75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${data.forecastMintemp.value}\u00B0", style: tempText),
            const Text("/", style: tempText),
            Text("${data.forecastMaxtemp.value}\u00B0", style: tempText),
          ],
        ),
      )
    ],
  );
}

SvgPicture _weatherSmallIcon(data) {
  return SvgPicture.asset(
    data,
    width: 35,
    height: 35,
  );
}
