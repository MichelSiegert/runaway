import 'package:away/Logic/information_place.dart';
import 'package:away/Logic/location.dart';
import 'package:away/Logic/weather.dart';
import 'package:away/Pages/Place/Widget/place_scaff.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

class LoadManager extends StatelessWidget {
  final InformationPlace place;

  const LoadManager({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([getMoreDataAboutPlace(place), getLongLat()]),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          Weather weather = snapshot.data![0] as Weather;
          Position pos = snapshot.data![1] as Position;
          return PlaceScaff(
            weather: weather,
            pos: pos,
            isMetric: place.isMetric,
          );
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

  Future getMoreDataAboutPlace(InformationPlace place) async =>
      await getWeatherByLatLon(
          double.parse(place.lat), double.parse(place.lon));
}
