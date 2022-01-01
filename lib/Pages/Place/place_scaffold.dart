import 'package:away/Logic/distcalculator.dart';
import 'package:away/Logic/location.dart';
import 'package:away/Pages/Place/Widget/ListEntry.dart';
import 'package:away/Widgets/googlemaps.dart';
import 'package:away/Logic/information_place.dart';
import 'package:away/Logic/weather.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

Widget buildPlace(BuildContext context, InformationPlace place) {
  return FutureBuilder(
    future: Future.wait([getMoreDataAboutPlace(place), getLongLat()]),
    builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
      if (snapshot.hasData) {
        Weather weather = snapshot.data![0] as Weather;
        Position pos = snapshot.data![1] as Position;
        return buildScaffold(weather, context, pos);
      } else if (snapshot.hasError) {
        return Center(child: Text(snapshot.error as String));
      } else if (!(snapshot.hasData || snapshot.hasError)) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return const Text("forgot to take care of this case?");
      }
    },
  );
}

Widget buildScaffold(Weather weather, BuildContext context, Position pos) {
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

Future getMoreDataAboutPlace(InformationPlace place) async =>
    await getWeatherByLatLon(double.parse(place.lat), double.parse(place.lon));
