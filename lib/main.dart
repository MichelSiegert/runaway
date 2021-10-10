import 'package:away/settings_page.dart';
import 'package:flutter/material.dart';

import 'locations_page.dart';
import 'menu_page.dart';

void main() => runApp(MaterialApp(routes:{
  '/':(context) => const MyHomePage(title: 'Runaway'),
'/settings':(context) => const SettingsPage(title: "Runaway"),
'/locations':(context) => const LocationsPage(title: "Runaway")}));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Runaway',
      home: MyHomePage(title: 'Runaway'),
    );
  }
}


