import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/weather_data.dart';
import './weather_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  var cityName;

  void onButtonPress() async {
    bool isValid = _formKey.currentState.validate();

    if (isValid) {
      _formKey.currentState.save();
      await Provider.of<WeatherData>(context, listen: false).getData(cityName);

      Navigator.of(context).pushNamed(WeatherPage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        image: new DecorationImage(
            image: AssetImage("Assets/bugsursky.jpg"), fit: BoxFit.fill),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // appBar: AppBar(
        //   backgroundColor: Color.fromRGBO(224, 225, 232, 1),
        //   title: Text(
        //     "WeatherMeter",
        //     style: TextStyle(
        //       color: Colors.black,
        //     ),
        //   ),
        // ),  //Do not enable...without this the app looks way to sexy
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  //color: Colors.white,
                  decoration: new BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.4),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      //decorationColor: Colors.white,
                      // backgroundColor: Colors.white,
                    ),
                    onSaved: (value) {
                      cityName = value;
                    },
                    validator: (value) {
                      if (value.length < 2) {
                        return "Please Enter a Valid City";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      // hoverColor: Colors.white,
                      // fillColor: Colors.white,
                      // focusColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),

                      // icon: Icon(
                      //   Icons.search,
                      //   color: Colors.white,
                      // ),
                      labelText: "Enter City",

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            FlatButton(
              onPressed: onButtonPress,
              color: Color.fromRGBO(255, 255, 255, 0.4),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
              child: Text(
                "Find Weather Data",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
