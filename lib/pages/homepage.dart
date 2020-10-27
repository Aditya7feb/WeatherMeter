import 'package:flutter/material.dart';
import 'package:weathermeter/services/webservices.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

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
              child: TextField(
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:  BorderSide(color: Colors.amber )
                  ),
                  labelStyle: TextStyle(
                    color:Colors.amber
                  ),
                  icon:Icon(Icons.search),
                  labelText: "Enter City",
                  border: OutlineInputBorder()
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
}
