import 'package:away/Logic/weather_parser.dart';
import 'package:away/Widgets/load_scaff.dart';

import 'package:away/Logic/Database/settings.dart';
import 'package:away/Logic/location.dart';
import 'package:away/Logic/weather.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'future_listview.dart';

class FutureMenuBody extends StatelessWidget {
  const FutureMenuBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getWeather(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Widget> weatherPlaces =
              parse(snapshot.data as Map<String, dynamic>);
          return FutureListview(places: weatherPlaces);
        } else if (snapshot.hasError) {
          return Text("error in future_menu_body: "+snapshot.error.toString());
        } else if (!(snapshot.hasError || snapshot.hasData)) {
          return const LoadingScaffold();
        } else {
          return const Text("forgot to implement this");
        }
      },
    );
  }

  Future getWeather() async {
    if(!await doesUserHaveSettings()) setupUser();
    Position pos = await getLongLat();
    String lang = await getSettings("lang");
    String unit = await getSettings("/unit/");
    return getWeatherInArea(pos.latitude, pos.longitude, lang, unit);
  }
}
