import 'package:away/Logic/information_place.dart';
import 'package:away/Pages/Place/place_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnePlace extends StatefulWidget {
  const OnePlace({Key? key, required String title}) : super(key: key);

  @override
  OnePlaceState createState() => OnePlaceState();
}

class OnePlaceState extends State<OnePlace> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as InformationPlace;
    return buildPlace(context, args);
  }
}
