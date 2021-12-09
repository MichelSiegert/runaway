
import 'package:weather/weather.dart';


Future<Weather> getWeatherByLongLat(double lat, double lon) async
{
  WeatherFactory wf = WeatherFactory("1c1a1b5bc5706b35790855762fe5b8c3", language: Language.GERMAN);
  Weather weather = await wf.currentWeatherByLocation(lat,lon);
  print(weather.temperature);
  return weather;
}