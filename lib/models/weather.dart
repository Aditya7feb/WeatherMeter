import 'package:flutter/foundation.dart';

class Weather {
  String name;
  String condition;
  String description;
  String icon;
  double temp;
  double humidity;
  double windSpeed;

  Weather({
    @required this.name,
    @required this.condition,
    @required this.description,
    @required this.humidity,
    @required this.icon,
    @required this.temp,
    @required this.windSpeed,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      name: json["name"],
      condition: json["weather"][0]["main"],
      description: json["weather"][0]["description"],
      humidity: json["main"]["humidity"],
      icon: "http://openweathermap.org/img/wn/${json["weather"][0]["icon"]}@2x.png",
      temp: json["main"]["temp"],
      windSpeed: json["wind"]["speed"],
    );
  }
}
