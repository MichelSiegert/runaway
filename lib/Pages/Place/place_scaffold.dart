import 'package:away/Logic/information_place.dart';
import 'package:away/Logic/weather.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

Scaffold placeScaffold(BuildContext context, InformationPlace place) => Scaffold(
      body: const Text("nice"),
      appBar: AppBar(
        title: Text(place.place),
        backgroundColor: Colors.green,
      ),
    );

Future<Weather> getMoreData(InformationPlace place) async =>
    await getWeatherByLatLon(double.parse(place.lat), double.parse(place.lon));
