import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weathermeter/models/weather.dart';
import '../models/weather_data.dart';

class WeatherPage extends StatefulWidget {
  static const routeName = "/weather-page";

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  Weather weather;
  @override
  void initState() {
    super.initState();
    weather = Provider.of<WeatherData>(context, listen: false).currentWeather;
  }

  // Use Weather . anything to get data from weather
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: new BoxDecoration(
            color: Colors.white,
            image: new DecorationImage(
                image: AssetImage("Assets/bugsursky.jpg"), fit: BoxFit.fill),
          ),
        ),
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(weather.description),
              Text('${weather.humidity}'),
              Image.network(weather.icon)
            ])
      ],
    ));
  }
}
