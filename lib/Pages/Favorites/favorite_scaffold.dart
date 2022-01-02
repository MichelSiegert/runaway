import 'package:away/Logic/Database/settings.dart';
import 'package:away/Logic/information_place.dart';
import 'package:away/Logic/weather.dart';
import 'package:away/Widgets/load_scaff.dart';
import 'package:away/Widgets/sidebar/sidebar.dart';
import 'package:away/Widgets/weather_card.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class FavoriteScaffold extends StatelessWidget {
  final List<String> places;

  const FavoriteScaffold({Key? key, required this.places}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _createListOfFavoriteWeather(places),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
              title: const Text("runaway"),
              backgroundColor: Colors.green,
            ),
              body: SizedBox.expand(
                child: ListView(
                  children: snapshot.data as List<WeatherCard>,
                ),
              ),
              drawer: const Sidebar(),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          else {
            return const LoadingScaffold();
          }
  }

  ,

  );
}

Future<List<WeatherCard>> _createListOfFavoriteWeather(
    List<String> favorites) async {
  List<WeatherCard> cards = [];

  for (String favorite in favorites) {
    Weather weather = await getWeatherByName(favorite);
    cards.add(WeatherCard(
      informationPlace: InformationPlace(
          lat: weather.latitude.toString(),
          lon: weather.longitude.toString(),
          place: favorite,
          weather: weather.weatherDescription!,
          temp: await (getSettings("unit")) == "metric"
              ? weather.tempFeelsLike!.celsius!.round().toString()
              : weather.tempFeelsLike!.fahrenheit!.round().toString()),
      key: null,
    ));
  }
  return cards;
}}
