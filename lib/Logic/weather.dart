import 'dart:convert';

import 'package:away/Logic/Database/settings.dart';
import 'package:away/Pages/Menu/menu_page.dart';
import 'package:away/Widgets/weather_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather/weather.dart';

import 'information_place.dart';

//this class handles the open weather api and parses the information.
Future<Weather> getWeatherByLongLat(double lat, double lon) async {
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

getWeatherInArea(final double lat, final double lon, final String language,
    String units, double myLoc) async {
  final int num = MenuPage.numEntries;
  final url = Uri.parse(
      "https://api.openweathermap.org/data/2.5/find?lat=$lat&lon=$lon&cnt=$num&appid=1c1a1b5bc5706b35790855762fe5b8c3&units=$units&lang=$language");
  final result = await http.post(url);
  final Map<String, dynamic> allData = jsonDecode(result.body);
  return parse(allData, myLoc);
}

Widget parse(Map<String, dynamic> json, double myLoc) {
  List<Widget> weatherCards = [];
  json.forEach((key, value) {
    if (key == "list") {
      List<dynamic> wetterInformationen = value;
      for (var wetterInformation in wetterInformationen) {
        List<String> values = getValues(wetterInformation);
        if (double.parse(values[3]) > myLoc) {
          weatherCards.add(WeatherCard(key: null,
              informationPlace: InformationPlace(place: values[0],lat: values[1], lon:  values[2], temp: values[3], weather: values[4]),
              ));
        }
      }
    }
  });
  if (weatherCards.isEmpty) {
    return const Center(
      child: Text("there is no escaping the bad weather, sorry pal!"),
    );
  }

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
    } else if (key == "coord") {
      ausgaben.add(getLat(value));
      ausgaben.add(getLon(value));
    }
  });
  for (var element in ausgaben) {
    print(element);
  }
  return ausgaben;
}

String getLat(Map<String, dynamic> coord) {
  String lat = "";
  coord.forEach((key, val) {
    if (key == "lat") lat = val.toString();
  });
  return lat;
}

String getLon(Map<String, dynamic> coord) {
  String lon = "";
  coord.forEach((key, value) {
    if (key == "lon") {
      lon = value.toString();
    }
  });
  return lon;
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
      if (key == "description") {
        weather = value.toString();
      }
    });
  }
  return weather;
}
