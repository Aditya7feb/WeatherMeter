import 'package:flutter/foundation.dart';

class Weather {
  String name;
  String condition;
  String description;
  String icon;
  var temp;
  var humidity;
  var windSpeed;
  var maxTemp;
  var minTemp;

  Weather({
    @required this.name,
    @required this.condition,
    @required this.description,
    @required this.humidity,
    @required this.icon,
    @required this.temp,
    @required this.windSpeed,
    this.maxTemp,
    this.minTemp,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    var iconData = json["weather"][0]["icon"];
    return Weather(
      name: json["name"],
      condition: json["weather"][0]["main"],
      description: json["weather"][0]["description"],
      humidity: json["main"]["humidity"],
      icon: "http://openweathermap.org/img/wn/$iconData@2x.png",
      temp: json["main"]["temp"],
      windSpeed: json["wind"]["speed"],
      maxTemp: json["main"]["temp_max"],
      minTemp: json["main"]["temp_min"]
    );
  }
}
