import 'package:away/Logic/Database/weather.dart';
import 'package:away/Logic/weather.dart';
import 'package:away/Widgets/weather_card.dart';
import 'package:weather/weather.dart';

import '../../Widgets/sidebar.dart';
import 'package:flutter/material.dart';

//
Scaffold locationScaffold(final String title, BuildContext context) =>
    Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.green,
      ),
      //Text in the middle of the page
      body: buildFuture(),
      //Menu Sidebar
      drawer: createSidebar(context),
    );


Widget buildFuture() {
  return FutureBuilder(
    future: getListOfFavorites(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return snapshot.data as SizedBox;
      } else {
        return const Center(child: CircularProgressIndicator()
        );
      }
    },
  );
}

Future getListOfFavorites() async {
  List<String> places = await allFavoritePlacesOfUser();
  print("nice");
  List<WeatherCard> cards = [];
  print("ice");
  for (var name in places) {
    Weather weather = await getWeatherByName(name);
    cards.add(WeatherCard(
        place: name,
        weather: weather.weatherDescription!,
        temp: weather.tempFeelsLike.toString(),


    ));
    print("ist ein spasst");
  }

  return SizedBox.expand(
      child: ListView(
        children: cards,
      ));
}
