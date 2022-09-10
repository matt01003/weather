class WeatherInfo {
  String? generalSituation;
  List<WeatherForecast>? weatherForecast;
  String? updateTime;
  SeaTemp? seaTemp;
  List<SoilTemp>? soilTemp;

  WeatherInfo(
      {generalSituation, weatherForecast, updateTime, seaTemp, soilTemp});

  WeatherInfo.fromJson(Map<String, dynamic> json) {
    generalSituation = json['generalSituation'];
    if (json['weatherForecast'] != null) {
      weatherForecast = <WeatherForecast>[];
      json['weatherForecast'].forEach((v) {
        weatherForecast!.add(WeatherForecast.fromJson(v));
      });
    }
    updateTime = json['updateTime'];
    seaTemp =
        json['seaTemp'] != null ? SeaTemp.fromJson(json['seaTemp']) : null;
    if (json['soilTemp'] != null) {
      soilTemp = <SoilTemp>[];
      json['soilTemp'].forEach((v) {
        soilTemp!.add(SoilTemp.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['generalSituation'] = generalSituation;
    if (weatherForecast != null) {
      data['weatherForecast'] =
          weatherForecast!.map((v) => v.toJson()).toList();
    }
    data['updateTime'] = updateTime;
    if (seaTemp != null) {
      data['seaTemp'] = seaTemp!.toJson();
    }
    if (soilTemp != null) {
      data['soilTemp'] = soilTemp!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WeatherForecast {
  String? forecastDate;
  String? week;
  String? forecastWind;
  String? forecastWeather;
  ForecastMaxtemp? forecastMaxtemp;
  ForecastMaxtemp? forecastMintemp;
  ForecastMaxtemp? forecastMaxrh;
  ForecastMaxtemp? forecastMinrh;
  int? forecastIcon;
  String? pSR;

  WeatherForecast(
      {forecastDate,
      week,
      forecastWind,
      forecastWeather,
      forecastMaxtemp,
      forecastMintemp,
      forecastMaxrh,
      forecastMinrh,
      forecastIcon,
      pSR});

  WeatherForecast.fromJson(Map<String, dynamic> json) {
    forecastDate = json['forecastDate'];
    week = json['week'];
    forecastWind = json['forecastWind'];
    forecastWeather = json['forecastWeather'];
    forecastMaxtemp = json['forecastMaxtemp'] != null
        ? ForecastMaxtemp.fromJson(json['forecastMaxtemp'])
        : null;
    forecastMintemp = json['forecastMintemp'] != null
        ? ForecastMaxtemp.fromJson(json['forecastMintemp'])
        : null;
    forecastMaxrh = json['forecastMaxrh'] != null
        ? ForecastMaxtemp.fromJson(json['forecastMaxrh'])
        : null;
    forecastMinrh = json['forecastMinrh'] != null
        ? ForecastMaxtemp.fromJson(json['forecastMinrh'])
        : null;
    forecastIcon = json['ForecastIcon'];
    pSR = json['PSR'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['forecastDate'] = forecastDate;
    data['week'] = week;
    data['forecastWind'] = forecastWind;
    data['forecastWeather'] = forecastWeather;
    if (forecastMaxtemp != null) {
      data['forecastMaxtemp'] = forecastMaxtemp!.toJson();
    }
    if (forecastMintemp != null) {
      data['forecastMintemp'] = forecastMintemp!.toJson();
    }
    if (forecastMaxrh != null) {
      data['forecastMaxrh'] = forecastMaxrh!.toJson();
    }
    if (forecastMinrh != null) {
      data['forecastMinrh'] = forecastMinrh!.toJson();
    }
    data['ForecastIcon'] = forecastIcon;
    data['PSR'] = pSR;
    return data;
  }
}

class ForecastMaxtemp {
  int? value;
  String? unit;

  ForecastMaxtemp({value, unit});

  ForecastMaxtemp.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['unit'] = unit;
    return data;
  }
}

class SeaTemp {
  String? place;
  int? value;
  String? unit;
  String? recordTime;

  SeaTemp({place, value, unit, recordTime});

  SeaTemp.fromJson(Map<String, dynamic> json) {
    place = json['place'];
    value = json['value'];
    unit = json['unit'];
    recordTime = json['recordTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['place'] = place;
    data['value'] = value;
    data['unit'] = unit;
    data['recordTime'] = recordTime;
    return data;
  }
}

class SoilTemp {
  String? place;
  num? value;
  String? unit;
  String? recordTime;
  Depth? depth;

  SoilTemp({place, value, unit, recordTime, depth});

  SoilTemp.fromJson(Map<String, dynamic> json) {
    place = json['place'];
    value = json['value'];
    unit = json['unit'];
    recordTime = json['recordTime'];
    depth = json['depth'] != null ? Depth.fromJson(json['depth']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['place'] = place;
    data['value'] = value;
    data['unit'] = unit;
    data['recordTime'] = recordTime;
    if (depth != null) {
      data['depth'] = depth!.toJson();
    }
    return data;
  }
}

class Depth {
  String? unit;
  num? value;

  Depth({unit, value});

  Depth.fromJson(Map<String, dynamic> json) {
    unit = json['unit'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['unit'] = unit;
    data['value'] = value;
    return data;
  }
}
