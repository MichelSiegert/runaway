import 'dart:convert';

import 'package:away/Logic/Database/settings.dart';
import 'package:away/Pages/Menu/menu_page.dart';
import 'package:weather/weather.dart';
import 'package:http/http.dart' as http;

//this class handles the open weather api and parses the information.
Future<Weather> getWeatherByLatLon(double lat, double lon) async {
  final WeatherFactory wf = await (getSettings("lang")) == "de"
      ? WeatherFactory("1c1a1b5bc5706b35790855762fe5b8c3",
          language: Language.GERMAN)
      : WeatherFactory("1c1a1b5bc5706b35790855762fe5b8c3",
          language: Language.ENGLISH);
  final Weather weather = await wf.currentWeatherByLocation(lat, lon);
  return weather;
}



Future<Weather> getWeatherByName(String name) async {
  final WeatherFactory wf = await (getSettings("lang")) == "de"
      ? WeatherFactory("1c1a1b5bc5706b35790855762fe5b8c3",
          language: Language.GERMAN)
      : WeatherFactory("1c1a1b5bc5706b35790855762fe5b8c3",
          language: Language.ENGLISH);
  final Weather weather = await wf.currentWeatherByCityName(name);
  return weather;
}

Future getWeatherInArea(final double lat, final double lon, final String language,
    String units) async {
  const int num = MenuPage.numEntries;
  final url = Uri.parse(
      "https://api.openweathermap.org/data/2.5/find?lat=$lat&lon=$lon&cnt=$num&appid=1c1a1b5bc5706b35790855762fe5b8c3&units=$units&lang=$language");
  final result = await http.post(url);
  final Map<String, dynamic> allData = jsonDecode(result.body);
  return allData;
}