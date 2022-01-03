import 'package:away/Logic/distcalculator.dart';
import 'package:away/Widgets/googlemaps.dart';
import 'package:away/Widgets/sidebar/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

import 'list_entry.dart';

class PlaceScaff extends StatelessWidget {
  final Weather weather;
  final Position pos;
  final bool isMetric;

  const PlaceScaff(
      {Key? key,
      required this.weather,
      required this.pos,
      required this.isMetric})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final params = {
      "distance: ": calculateDistanceBetween2PointsBasedOnLatLon(pos.latitude,
                  pos.longitude, weather.latitude!, weather.longitude!)
              .toString() +
          "km",
      "temperature: ": isMetric
          ? weather.tempFeelsLike!.celsius!.roundToDouble().toString()
          : weather.tempFeelsLike!.fahrenheit!.roundToDouble().toString() +
              (isMetric ? "°C" : "°F"),
      "cloudiness: ": weather.cloudiness.toString() + "%",
      "Humidity: ": weather.humidity.toString() + "%",
      "Pressure: ": weather.pressure.toString() + "hPa",
      "Rain recently? ": weather.rainLast3Hours == null
          ? "no"
          : weather.rainLast3Hours.toString() + "mm",
      "Snow recently? ": weather.snowLast3Hours == null
          ? "no"
          : weather.snowLast3Hours.toString() + "mm",
      "Temperature range: ": (isMetric
              ? weather.tempMin!.celsius!.round().toString()
              : weather.tempMin!.fahrenheit!.round().toString()) +
          " - " +
          (isMetric
              ? weather.tempMax!.celsius!.round().toString()
              : weather.tempMax!.fahrenheit!.round().toString() +
                  (isMetric ? "°C" : "°F")),
      "Weather description: ": weather.weatherDescription.toString(),
      "Speed of wind: ":
          weather.windSpeed.toString() + (isMetric ? "m/s" : "mph"),
      "Wind direction: ": weather.windSpeed.toString() + "degrees"
    };
    return Scaffold(
      appBar: AppBar(
        title: Text(weather.areaName!),
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (var entries in params.entries)
            ListEntry(text: entries.key, value: entries.value),
          googleMap(context, weather.latitude!, weather.longitude!, pos)
        ],
      ),
      drawer: const Sidebar(),
    );
  }
}
