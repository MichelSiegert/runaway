import 'package:away/Logic/location.dart';
import 'package:away/Logic/weather.dart';
import 'package:away/Widgets/sidebar.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return menuScaffold("Runaway", context);
  }

  Scaffold menuScaffold(final String title, BuildContext context) => Scaffold(
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
    var _currentPosition = await getLongLat();
    return getWeatherInArea(
        _currentPosition.latitude, _currentPosition.longitude);
  }
}
