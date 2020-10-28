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
    var device = MediaQuery.of(context).size;

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
              Container(
                  margin: EdgeInsets.all(50),
                  width: device.width * 0.8,
                  height: device.height * 0.5,
                  decoration: new BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.25),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20)),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${weather.name}'.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                            weather.icon,
                            color: Colors.white,
                          )
                        ],
                      ),
                      Text(
                        weather.description.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      Text(
                        '${weather.temp}' '°C',
                        style: TextStyle(
                          //backgroundColor: Color.fromRGBO(255, 255, 255, 0.5),
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      Text(
                        'Humidity: '
                        '${weather.humidity}'
                        '%',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        ''
                        'Wind: '
                        '${weather.windSpeed}'
                        'km/h',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
