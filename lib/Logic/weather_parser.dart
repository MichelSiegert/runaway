import 'package:away/Widgets/weather_card.dart';
import 'package:flutter/material.dart';

import 'information_place.dart';

List<Widget>? parse(Map<String, dynamic> json, double myLoc) {
  List<Widget> weatherCards = [];
  json.forEach((key, value) {
    if (key == "list") {
      List<dynamic> wetterInformationen = value;
      for (var wetterInformation in wetterInformationen) {
        List<String> values = getValues(wetterInformation);
        if (double.parse(values[3]) > myLoc) {
          weatherCards.add(WeatherCard(
            key: null,
            informationPlace: InformationPlace(
                place: values[0],
                lat: values[1],
                lon: values[2],
                temp: values[3],
                weather: values[4]),
          ));
        }
      }
    }
  });

  return weatherCards;
}

List<String> getValues(Map<String, dynamic> weatherinfo) {
  List<String> ausgaben = [];
  weatherinfo.forEach((key, value) {
    if (key == "name") {
      ausgaben.add(value);
    } else if (key == "main") {
      ausgaben.add(getTemp(value));
    } else if (key == "weather") {
      ausgaben.add(getWeather(value));
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

String getTemp(Map<String, dynamic> weatherinfo) {
  String temp = "";
  weatherinfo.forEach((key, value) {
    if (key == "feels_like") {
      temp = value.toString();
    }
  });
  return temp;
}

String getWeather(List<dynamic> weatherinfo) {
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
