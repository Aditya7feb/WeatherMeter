import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weathermeter/models/weather.dart';

import '../api.dart';

class Webservices{

final api = apiKey;

Future<Weather> fetchWeatherData(String cityName) async{

 var url ="http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$api&units=metric";


 final response = await http.get(url);

 if(response.statusCode==200){

   var jsonData= jsonDecode(response.body);

   //print(jsonData);
   return Weather.fromJson(jsonData);

 }else{
   throw Exception("could not fetch data");
 }


}





}