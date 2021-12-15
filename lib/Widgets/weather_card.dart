import 'dart:core';

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
        leading: isFavorite
            ? const Icon(
                Icons.favorite,
                color: Colors.pink,
              )
            : const Icon(
                Icons.favorite_border,
                color: Colors.pink,
              ),
        title: Text(widget.place),
        trailing: Text(widget.temp),
        onTap: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        });
  }

  @override
  void initState() {
    isFavorite = false;
    super.initState();
  }
}
