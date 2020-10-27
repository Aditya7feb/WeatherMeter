import '../models/weather.dart';
import '../services/webservices.dart';
class WeatherData{


Weather _currentWeather;

Future<void> getData(String cityName)async{

_currentWeather = await Webservices().fetchWeatherData(cityName);


}

String get name{
  return _currentWeather.name;
}

String get condition{
  return _currentWeather.condition;
}

String get description{
  return _currentWeather.description;
}

String get iconUrl{
  return _currentWeather.icon;
}

double get temp{
  return _currentWeather.temp;
}

int get humidity{
  return _currentWeather.humidity;
}

double get windspeed{
  return _currentWeather.windSpeed;
}







}