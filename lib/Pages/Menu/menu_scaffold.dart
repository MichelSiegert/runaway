import 'package:away/Logic/Database/settings.dart';
import 'package:away/Logic/location.dart';
import 'package:away/Logic/screen_size_calculator.dart';
import 'package:away/Logic/weather.dart';
import 'package:away/Widgets/sidebar.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  double? myLoc;

  @override
  Widget build(BuildContext context) {
    return menuScaffold("Runaway", context);
  }

  Scaffold menuScaffold(final String title, BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Container(
            width: calculateWidth(1, context),
            height: calculateHeight(0.15, context),
            child: makeFooter(context)),
      ),
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.green,
      ),
      //Text in the middle of the page
      body: SizedBox.expand(
        child: makeBody(context),
      ),

      //Menu Sidebar
      drawer: createSidebar(context),
    );
  }

  Widget makeFooter(BuildContext context) {
    return FutureBuilder(
      future: getWeatherForLocation(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Weather w = snapshot.data as Weather;
          myLoc = w.tempFeelsLike!.celsius;
          return Column(
            children: [
              Center(child: Text(w.areaName!)),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                const Text("Tempreature"),
                Text(w.tempFeelsLike!.celsius!.floor().toString())
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("Condition"),
                  Text(w.weatherDescription!)
                ],
              )
            ],
          );
        } else if (snapshot.hasError) {
          return const Text("A CRITICAL ERROR HAS OCCURED!");
        } else {
          return Center(
            child: SizedBox(
              height: calculateHeight(0.05, context),
              width: calculateWidth(0.05, context),
              child: const CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Widget makeBody(BuildContext context) {
    return FutureBuilder(
        future: _getData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: snapshot.data);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  Future _getData() async {
    bool canLogin = await doesUserExist() && await doesUserHaveSettings();
    if (!canLogin) setupUser();
    var _currentPosition = await getLongLat();
    String lang = await getSettings("lang");
    print(":" + lang + ":");
    String units = await getSettings("unit");
    while(myLoc == null){}
    return getWeatherInArea(
        _currentPosition.latitude, _currentPosition.longitude, lang, units, myLoc!);
  }

  Future getWeatherForLocation() async {
    Position p = await getLongLat();
    return await getWeatherByLongLat(p.latitude, p.longitude);
  }
}
