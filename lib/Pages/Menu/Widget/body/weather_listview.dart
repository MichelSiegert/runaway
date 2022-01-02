import 'package:away/Widgets/weather_card.dart';
import 'package:flutter/material.dart';

class WeatherListview extends StatelessWidget {
  final double mytemp;
  final List<Widget> places;

  const WeatherListview({Key? key, required this.mytemp, required this.places})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var warmer = places
        .where((element) =>
            double.parse((element as WeatherCard).informationPlace.temp) >
            mytemp)
        .toList();
    bool placesExist = warmer.isNotEmpty;
    if (placesExist) {
      return ListView(
        children: warmer,
      );
    } else {
      return const Text("there are is no escaping the bad weather!");
    }
  }
}
