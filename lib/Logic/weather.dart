import 'dart:convert';

import 'package:away/Pages/Menu/menu_page.dart';
import 'package:away/Widgets/weather_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather/weather.dart';

Future<Weather> getWeatherByLongLat(double lat, double lon) async {
  final WeatherFactory wf = WeatherFactory("1c1a1b5bc5706b35790855762fe5b8c3",
      language: Language.GERMAN);
  final Weather weather = await wf.currentWeatherByLocation(lat, lon);
  return weather;
}

Future<Weather> getWeatherByName(String name) async
{
  final WeatherFactory wf = WeatherFactory("1c1a1b5bc5706b35790855762fe5b8c3",
      language: Language.GERMAN);
  final Weather weather = await wf.currentWeatherByCityName(name);
  return weather;
  }

getWeatherInArea(final double lat, final double lon, final String lan, String units) async {
  final int num = MenuPage.numEntries;
  final url = Uri.parse(
      "https://api.openweathermap.org/data/2.5/find?lat=$lat&lon=$lon&cnt=$num&appid=1c1a1b5bc5706b35790855762fe5b8c3&lang=$lan&units=$units");
  final result = await http.post(url);
  final Map<String, dynamic> allData = jsonDecode(result.body);
  return parse(allData);
}

Widget parse(Map<String, dynamic> json) {
  List<Widget> weatherCards = [];
  json.forEach((key, value) {
    // get all entries.
    if (key == "list") {
      List<dynamic> wetterInformationen = value;
      for (var wetterInformation in wetterInformationen) {
        List<String> values = getValues(wetterInformation);
        weatherCards.add(
            WeatherCard(place: values[0], temp: values[1], weather: values[2]));
      }
    }
  });

  return ListView(children: weatherCards);
}

List<String> getValues(Map<String, dynamic> weatherinfo) {
  List<String> ausgaben = [];
  weatherinfo.forEach((key, value) {
    if (key == "name") {
      ausgaben.add(value);
    } else if (key == "main") {
      ausgaben.add(getTempFromJSON(value));
    } else if (key == "weather") {
      ausgaben.add(getWeatherFromJSON(value));
    }
  });
  return ausgaben;
}

String getTempFromJSON(Map<String, dynamic> weatherinfo) {
  String temp = "";
  weatherinfo.forEach((key, value) {
    if (key == "feels_like") {
      temp = value.toString();
    }
  });
  return temp;
}

String getWeatherFromJSON(List<dynamic> weatherinfo) {
  String weather = "";
  for (var value in weatherinfo) {
    Map<String, dynamic> isClouded = value;
    isClouded.forEach((key, value) {
      if (key == "main") {
        weather = value.toString();
      }
    });
  }
  return weather;
}
