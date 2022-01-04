import 'package:away/Logic/screen_size_calculator.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class MenuFooter extends StatelessWidget {
  final Weather weather;
  final bool isCelsius;

  const MenuFooter({Key? key, required this.weather, required this.isCelsius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(color: Colors.white,
      fontWeight: FontWeight.bold),
        child: Container(
      color: Colors.blueGrey[900],
        child: SizedBox(
      width: calculateWidth(1, context),
      height: calculateWidth(0.15, context),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(weather.areaName!),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            const Text("Temperature"),
            Text(isCelsius
                ? weather.tempFeelsLike!.celsius!.toStringAsFixed(0) + "°C"
                : weather.tempFeelsLike!.fahrenheit!.toStringAsFixed(0) + "°F")
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            const Text("Weather"),
            Text(weather.weatherDescription.toString())
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            const Text("Wind"),
            Text(weather.windSpeed.toString() + (isCelsius ? "m/s" : "mph"))
          ])
        ],
      ),
    )));
  }
}
