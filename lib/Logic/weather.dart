import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/weather.dart';


Future<Weather> getWeatherByLongLat(double lat, double lon) async
{
  final WeatherFactory wf = WeatherFactory("1c1a1b5bc5706b35790855762fe5b8c3",
      language: Language.GERMAN);
  final Weather weather = await wf.currentWeatherByLocation(lat, lon);
  return weather;
}

getWeatherInArea(final double lat, final double lon) async {
  final url = Uri.parse(
      "https://api.openweathermap.org/data/2.5/find?lat=$lat&lon=$lon&cnt=50&appid=1c1a1b5bc5706b35790855762fe5b8c3&lang=de&units=metric");

  final result = await http.post(url);
  final parsed = jsonDecode(result.body);
  print(parsed);
}
