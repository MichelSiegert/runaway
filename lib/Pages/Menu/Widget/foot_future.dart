import 'package:away/Logic/location.dart';
import 'package:away/Logic/weather.dart';
import 'package:away/Widgets/load_scaff.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

import 'menu_footer.dart';

class BottomNavigationBarFuture extends StatelessWidget {
  const BottomNavigationBarFuture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getWeatherOfLocation(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Weather w = snapshot.data! as Weather;

            return MenuFooter(weather: w);
          }
          else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          else if (!(snapshot.hasError || snapshot.hasData)) {
            return const LoadingScaffold();
          }
          else {
            return const Text("forgot to implement a case in FOOT_FUTURE");
          }
        }
    );
  }

        Future getWeatherOfLocation()
    async
    {
      Position pos = await getLongLat();
      return await getWeatherByLatLon(pos.latitude, pos.longitude);
    }
  }
