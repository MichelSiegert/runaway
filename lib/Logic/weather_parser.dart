import 'package:away/Widgets/weather_card.dart';
import 'package:flutter/material.dart';

import 'information_place.dart';

List<Widget> parse(Map<String, dynamic> json, String unit) {
  List<Widget> weatherCards = [];
  json.forEach((key, value) {
    if (key == "list") {
      List<dynamic> wetterInformationen = value;
      for (var wetterInformation in wetterInformationen) {
        List<String> values = _getValues(wetterInformation);
        weatherCards.add(WeatherCard(
          key: null,
          informationPlace: InformationPlace(
            place: values[0],
            lat: values[1],
            lon: values[2],
            temp: values[3],
            weather: values[4],
            isMetric: unit == "metric",
          ),
        ));
      }
    }
  });

  return weatherCards;
}

List<String> _getValues(Map<String, dynamic> weatherinfo) {
  List<String> ausgaben = [];
  weatherinfo.forEach((key, value) {
    if (key == "name") {
      ausgaben.add(value);
    } else if (key == "main") {
      ausgaben.add(_getTemp(value));
    } else if (key == "weather") {
      ausgaben.add(_getWeather(value));
    } else if (key == "coord") {
      ausgaben.add(_getLat(value));
      ausgaben.add(_getLon(value));
    }
  });
  return ausgaben;
}

String _getLat(Map<String, dynamic> coord) {
  String lat = "";
  coord.forEach((key, val) {
    if (key == "lat") lat = val.toString();
  });
  return lat;
}

String _getLon(Map<String, dynamic> coord) {
  String lon = "";
  coord.forEach((key, value) {
    if (key == "lon") {
      lon = value.toString();
    }
  });
  return lon;
}

String _getTemp(Map<String, dynamic> weatherinfo) {
  String temp = "";
  weatherinfo.forEach((key, value) {
    if (key == "feels_like") {
      temp = value.toStringAsFixed(0);
    }
  });
  return temp;
}

String _getWeather(List<dynamic> weatherinfo) {
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
