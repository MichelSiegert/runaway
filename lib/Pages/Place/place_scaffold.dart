import 'package:away/Logic/distcalculator.dart';
import 'package:away/Logic/location.dart';
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
  return Scaffold(
    appBar: AppBar(
      title: Text(weather.areaName!),
      backgroundColor: Colors.green,
    ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text("distance:"),
            Text(calculateDistancebetween2PointsBasedOnLatLon(pos.latitude,pos.longitude, weather.latitude!, weather.longitude!).toString()+"km")
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text("temperature:"),
            Text(weather.tempFeelsLike!.toString())
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text("cloudiness: "),
            Text(weather.cloudiness.toString())
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text("humidity:"),
            Text(weather.humidity.toString())
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text("pressure:"),
            Text(weather.pressure.toString())
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text("rain recently?:"),
            weather.rainLast3Hours == null
                ? const Text("no")
                : Text(weather.rainLast3Hours.toString())
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text("snow last 3 hours?:"),
            weather.snowLast3Hours == null
                ? const Text("no")
                : Text(weather.snowLast3Hours.toString())
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text("temperature range:"),
            Text(
                weather.tempMin.toString() + " - " + weather.tempMax.toString())
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text("weather description: "),
            Text(weather.weatherDescription.toString())
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text("speed of wind:"),
            Text(weather.windSpeed.toString())
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text("wind direction: "),
            Text(weather.windDegree.toString())
          ],
        ),
        googleMap(context, weather.latitude!, weather.longitude!, pos)
      ],
    ),
  );
}

Future getMoreDataAboutPlace(InformationPlace place) async =>
    await getWeatherByLatLon(double.parse(place.lat), double.parse(place.lon));
