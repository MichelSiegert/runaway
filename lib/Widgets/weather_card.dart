import 'dart:core';

import 'package:away/Logic/Database/weather.dart';
import 'package:away/Logic/information_place.dart';
import 'package:flutter/material.dart';

//creates the weather card for locations and favorites.
class WeatherCard extends StatefulWidget {
  final InformationPlace informationPlace;

  const WeatherCard({
    required Key? key,
    required this.informationPlace,
  }) : super(key: key);

  @override
  _WeatherCardState createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  late bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: FutureBuilder(
          future: isThisPlaceAFavoriteOfUser(widget.informationPlace.place),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              bool res = snapshot.data as bool;
              return res
                  ? IconButton(
                      onPressed: () {
                        tapWeatherCardToDataBase(widget.informationPlace.place);
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      icon: const Icon(Icons.favorite),
                      color: Colors.green,
                    )
                  : IconButton(
                      onPressed: () {
                        tapWeatherCardToDataBase(widget.informationPlace.place);
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      icon: const Icon(Icons.favorite_border),
                      color: Colors.green,
                    );
            }
            return const Text("");
          },
        ),
        title: Text(widget.informationPlace.place),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Text(widget.informationPlace.weather),
          Text(widget.informationPlace.temp+(widget.informationPlace.isMetric? "°C":"°F"))
        ]),
        onTap: () {
          Navigator.pushNamed(context, "/onePlace",
              arguments: widget.informationPlace);
        });
  }

  @override
  initState() {
    isFavorite = false;
    super.initState();
  }
}
