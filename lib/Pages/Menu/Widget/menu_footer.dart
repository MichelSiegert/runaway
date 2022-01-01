import 'package:away/Logic/screen_size_calculator.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class MenuFooter extends StatelessWidget {
  final Weather weather;

  const MenuFooter({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: calculateWidth(1, context),
      height: calculateWidth(0.15, context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(weather.areaName!),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            const Text("Temperature"),
            Text(weather.tempFeelsLike.toString())
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            const Text("Weather"),
            Text(weather.weatherDescription.toString())
          ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [const Text("Wind"), Text(weather.windSpeed.toString())])
        ],
      ),
    );
  }
}
