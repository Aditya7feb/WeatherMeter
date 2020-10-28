import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weathermeter/models/weather_data.dart';

import './pages/homepage.dart';
import './pages/weather_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather Meter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
        routes: {WeatherPage.routeName: (ctx) => WeatherPage()},
      ),
    );
  }
}
