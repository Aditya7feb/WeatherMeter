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
    var kolors = Color.fromARGB(150, 30, 128, 240);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: new BoxDecoration(
              color: Colors.white,
              image: new DecorationImage(
                  image: AssetImage("Assets/blur1.jpg"), fit: BoxFit.fill),
            ),
          ),
          Center(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(40),
              width: device.width,
              height: device.height / 2,
              decoration: new BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.25),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    colors: [kolors, Colors.black45], //don't change
                    end: Alignment.bottomRight,
                    stops: [0.5, 0.9],
                    tileMode: TileMode.clamp,
                    transform: null,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: kolors,
                      blurRadius: 0,
                      offset: Offset.zero,
                      spreadRadius: 10.0,
                    ),
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Container(
                  //     margin: EdgeInsets.all(50),
                  //     width: device.width * 0.8,
                  //     height: device.height * 0.5,
                  //     decoration: new BoxDecoration(
                  //         color: Color.fromRGBO(255, 255, 255, 0.25),
                  //         shape: BoxShape.rectangle,
                  //         borderRadius: BorderRadius.circular(20)),
                  //     child:
                  new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${weather.name}'.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
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
                            fit: BoxFit.fitHeight,
                            height: device.height * 0.2,
                            width: device.width * 0.3,
                          )
                        ],
                      ),
                      Text(
                        weather.description.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: device.width * 0.08,
                          fontWeight: FontWeight.w500,
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
                  ), //),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
