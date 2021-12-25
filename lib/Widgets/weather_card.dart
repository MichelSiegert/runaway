import 'dart:core';

import 'package:away/Logic/Database/weather.dart';
import 'package:flutter/material.dart';

class WeatherCard extends StatefulWidget {
  final String place;
  final String temp;
  final String weather;

  const WeatherCard(
      {Key? key,
      required this.place,
      required this.temp,
      required this.weather})
      : super(key: key);

  @override
  _WeatherCardState createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  late bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: FutureBuilder(
          future: isThisPlaceAFavoriteOfUser(widget.place),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              bool res = snapshot.data as bool;
              return res
                  ? IconButton(
                      onPressed: () {
                        tapWeatherCardToDataBase(widget.place);
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      icon: const Icon(Icons.favorite),
                      color: Colors.pink,
                    )
                  : IconButton(
                      onPressed: () {
                        tapWeatherCardToDataBase(widget.place);
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      icon: const Icon(Icons.favorite_border),
                      color: Colors.pink,
                    );
            }
            return const Text("");
          },
        ),
        title: Text(widget.place),
        trailing: Column(children: [Text(widget.weather), Text(widget.temp)]),
        onTap: () {
          /*TODO IMPLEMENT TAPPING*/
        });
  }

  @override
  initState() {
    isFavorite = false;
    super.initState();
  }
}
