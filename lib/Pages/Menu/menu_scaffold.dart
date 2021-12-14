import 'package:away/Logic/location.dart';
import 'package:away/Logic/weather.dart';

import 'package:away/Logic/database.dart';
import 'package:away/Widgets/loading_animation.dart';

import '../../Widgets/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Position? _currentPosition;
  String? _currentAddress;

  @override
  Widget build(BuildContext context) {
    return menuScaffold("Runaway", context);
  }

//
  Scaffold menuScaffold(final String title, BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: Colors.green,
        ),
        //Text in the middle of the page
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (_currentAddress != null) Text(_currentAddress!),
              TextButton(
                child: const Text("Get location!"),
                onPressed: () {
                  fun();
                  _getCurrentLocation();
                },
              )
            ],
          ),
        ),
        //Menu Sidebar
        drawer: createSidebar(context),
      );

  _getCurrentLocation() async {
    loadingAnimation(context);
    _currentPosition = await getLongLat();
    getWeatherByLongLat(
        _currentPosition!.latitude, _currentPosition!.longitude);
    Placemark? place = await getAddressFromLatLng(_currentPosition!);
    Navigator.pop(context);
    if (place != null) {
      setState(() {
        _currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    }
  }
}
