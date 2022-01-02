import 'package:away/Logic/Database/settings.dart';
import 'package:away/Logic/location.dart';
import 'package:away/Logic/weather.dart';
import 'package:away/Pages/Menu/Widget/body/weather_listview.dart';
import 'package:away/Widgets/load_scaff.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

class FutureListview extends StatelessWidget {
  final List<Widget> places;

  const FutureListview({Key? key, required this.places}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([_getMyLocationData(), getSettings("unit")]),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          Weather w = snapshot.data![0] as Weather;
          bool isCelsius = (snapshot.data![1] as String) == "metric";
          return WeatherListview(
              mytemp: isCelsius
                  ? w.tempFeelsLike!.celsius!
                  : w.tempFeelsLike!.fahrenheit!,
              places: places);
        } else if (snapshot.hasError) {
          return Text("Error in future_listview: "+snapshot.error.toString());
        } else if (!(snapshot.hasError || snapshot.hasData)) {
          return const LoadingScaffold();
        } else {
          return const Text("forgot to implement this");
        }
      },
    );
  }

  Future _getMyLocationData() async {
    Position pos = await getLongLat();
    print (":C:");
    Weather w = await getWeatherByLatLon(pos.latitude, pos.longitude);
    return w;
  }
}
