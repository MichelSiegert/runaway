import 'package:away/Logic/distcalculator.dart';
import 'package:away/Widgets/googlemaps.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

import 'ListEntry.dart';

class PlaceScaff extends StatelessWidget {
  final Weather weather;
  final Position pos;

  PlaceScaff({Key? key, required this.weather, required this.pos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final params = {
      "distance": calculateDistancebetween2PointsBasedOnLatLon(pos.latitude,
                  pos.longitude, weather.latitude!, weather.longitude!)
              .toString() +
          "km",
      "temperature": weather.tempFeelsLike!.toString(),
      "cloudiness": weather.cloudiness.toString(),
      "Humidity": weather.humidity.toString(),
      "Pressure": weather.pressure.toString(),
      "Rain recently?": weather.rainLast3Hours == null
          ? "no"
          : weather.rainLast3Hours.toString(),
      "Snow recently": weather.snowLast3Hours == null
          ? "no"
          : weather.snowLast3Hours.toString(),
      "Temperature range":
          weather.tempMin.toString() + " - " + weather.tempMax.toString(),
      "Weather description": weather.weatherDescription.toString(),
      "Speed of wind:": weather.windSpeed.toString(),
      "Wind direction": weather.windSpeed.toString()
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
    );
  }
}
