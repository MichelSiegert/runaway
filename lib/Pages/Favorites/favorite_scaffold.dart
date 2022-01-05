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
              backgroundColor: Colors.blueGrey[900],
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
        } else {
          return const LoadingScaffold();
        }
      },
    );
  }

  Future<List<WeatherCard>> _createListOfFavoriteWeather(
      List<String> favorites) async {
    List<WeatherCard> cards = [];

    for (String favorite in favorites) {
      final Weather weather = await getWeatherByName(favorite);
      final bool isMetric = await (getSettings("unit")) == "metric";
      cards.add(WeatherCard(
        informationPlace: InformationPlace(
            lat: weather.latitude.toString(),
            lon: weather.longitude.toString(),
            place: favorite,
            weather: weather.weatherDescription!,
            temp: isMetric
                ? weather.tempFeelsLike!.celsius!.round().toString()
                : weather.tempFeelsLike!.fahrenheit!.round().toString(),
            isMetric: isMetric),
        key: null,
      ));
    }
    return cards;
  }
}
