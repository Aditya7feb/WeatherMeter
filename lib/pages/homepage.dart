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

  void onButtonPress()async{
   bool isValid= _formKey.currentState.validate();

   if(isValid) {
     _formKey.currentState.save();
     await Provider.of<WeatherData>(context,listen: false).getData(cityName);
     
     Navigator.of(context).pushNamed(WeatherPage.routeName );
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WeatherMeter"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                onSaved: (value) {
                  cityName = value;
                },
                validator: (value) {
                  if (value.length < 3) {
                    return "Please Enter a Valid City";
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber)),
                    labelStyle: TextStyle(color: Colors.amber),
                    icon: Icon(Icons.search),
                    labelText: "Enter City",
                    border: OutlineInputBorder()),
              ),
            ),
          ),
          FlatButton(onPressed: onButtonPress , child: Text("Find Weather Data"),),
        ],
      ),
    );
  }
}
