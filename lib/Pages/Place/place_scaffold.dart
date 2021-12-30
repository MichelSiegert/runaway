import 'package:away/Widgets/googlemaps.dart';
import 'package:away/Logic/information_place.dart';
import 'package:away/Logic/weather.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

Widget buildPlace(BuildContext context, InformationPlace place) {
  return FutureBuilder(
    future: getMoreData(place),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        Weather weather = snapshot.data as Weather;
        return buildScaffold(weather, context);
      } else if (snapshot.hasError) {
        return Center(child: Text(snapshot.error as String));
      } else {
        return const Center(child: Text("forgot to implement case!"));
      }
    },
  );
}

Widget buildScaffold(Weather weather, BuildContext context) {
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
          children: [const Text("humidity:"), Text(weather.humidity.toString())],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [const Text("pressure:"), Text(weather.pressure.toString())],
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
        googleMap(context)
      ],
    ),
  );

}

Future getMoreData(InformationPlace place) async =>
    await getWeatherByLatLon(double.parse(place.lat), double.parse(place.lon));
