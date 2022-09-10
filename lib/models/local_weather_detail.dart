class LocalWeatherDetail {
  String? generalSituation;
  String? tcInfo;
  String? fireDangerWarning;
  String? forecastPeriod;
  String? forecastDesc;
  String? outlook;
  String? updateTime;

  LocalWeatherDetail(
      {this.generalSituation,
      this.tcInfo,
      this.fireDangerWarning,
      this.forecastPeriod,
      this.forecastDesc,
      this.outlook,
      this.updateTime});

  LocalWeatherDetail.fromJson(Map<String, dynamic> json) {
    generalSituation = json['generalSituation'];
    tcInfo = json['tcInfo'];
    fireDangerWarning = json['fireDangerWarning'];
    forecastPeriod = json['forecastPeriod'];
    forecastDesc = json['forecastDesc'];
    outlook = json['outlook'];
    updateTime = json['updateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['generalSituation'] = this.generalSituation;
    data['tcInfo'] = this.tcInfo;
    data['fireDangerWarning'] = this.fireDangerWarning;
    data['forecastPeriod'] = this.forecastPeriod;
    data['forecastDesc'] = this.forecastDesc;
    data['outlook'] = this.outlook;
    data['updateTime'] = this.updateTime;
    return data;
  }
}
