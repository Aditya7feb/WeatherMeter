import 'dart:math';

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
  static const List<Color> colorList = [
    Color.fromRGBO(7, 13, 89, 0.5),
    Color.fromRGBO(255, 213, 205, 0.5),
    Color.fromRGBO(192, 96, 161, 0.5),
    Color.fromRGBO(1, 197, 196, 0.5),
    Color.fromRGBO(89, 9, 149, 0.5),
    Color.fromRGBO(245, 106, 121, 0.5),
    Color.fromRGBO(204, 246, 200, 0.5), // litish lime green
    Color.fromRGBO(255, 239, 160, 0.5), // canary light yellow
  ];

  var kolors;
  Weather weather;
  @override
  void initState() {
    super.initState();
    weather = Provider.of<WeatherData>(context, listen: false).currentWeather;
    var i = Random();
    int rndm = i.nextInt(colorList.length);
    kolors = colorList[rndm];
  }

  // Use Weather . anything to get data from weather
  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              image: const DecorationImage(
                  image: AssetImage("Assets/blur1.jpg"), fit: BoxFit.fill),
            ),
          ),
          Center(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(10),
              width: device.width,
              height: device.height,
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: device.height * 0.08),
                  Container(
                    child: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                    margin: EdgeInsets.only(left: device.width * 0.65),
                  ),
                  SizedBox(height: device.height * 0.07),
                  new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 40,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '${weather.name}'.toUpperCase(),
                        style: const TextStyle(
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
                      SizedBox(height: 10),
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
                      SizedBox(height: 10),
                      Text(
                        'Humidity: '
                        '${weather.humidity}'
                        '%',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 5),
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
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 10,
                        width: device.width * 0.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.horizontal(left:Radius.circular(10),right:Radius.circular(10),),
                          gradient: LinearGradient(
                            colors: [Colors.redAccent, Colors.blueAccent],
                          ),
                        ),
                      ),
                      SizedBox(height:10),
                      Container(
                        width: device.width*0.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${weather.maxTemp} °C",style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),),
                            Text("${weather.minTemp} °C",style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,),),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
