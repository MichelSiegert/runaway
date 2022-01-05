import 'package:away/Logic/Database/settings.dart';
import 'package:away/Logic/location.dart';
import 'package:away/Logic/screen_size_calculator.dart';
import 'package:away/Logic/weather.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

import 'menu_footer.dart';

class BottomNavigationBarFuture extends StatelessWidget {
  const BottomNavigationBarFuture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.wait([getWeatherOfLocation(), getSettings("unit")]),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            Weather w = snapshot.data![0] as Weather;
            String unit = snapshot.data![1];
            bool isCelsius = unit == "metric";
            return MenuFooter(weather: w, isCelsius: isCelsius);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if (!(snapshot.hasError || snapshot.hasData)) {
            return SizedBox(
              width: calculateWidth(1, context),
              height: calculateWidth(0.15, context),
              child: Container(
                color: Colors.blueGrey[900],
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          } else {
            return const Text("forgot to implement a case in FOOT_FUTURE");
          }
        });
  }

  Future getWeatherOfLocation() async {
    Position pos = await getLongLat();
    return await getWeatherByLatLon(pos.latitude, pos.longitude);
  }
}
