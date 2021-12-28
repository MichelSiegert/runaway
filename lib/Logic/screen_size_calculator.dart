import 'package:flutter/cupertino.dart';

//
double calculateHeight(double height, BuildContext context) =>
    MediaQuery.of(context).orientation == Orientation.portrait
        ? MediaQuery.of(context).size.height * height
        : MediaQuery.of(context).size.width * height;

//berchnet die weite des Widgets unterschiedlich im Landscape/Portrait modus.
double calculateWidth(double width, BuildContext context) =>
    MediaQuery.of(context).orientation == Orientation.portrait
        ? MediaQuery.of(context).size.height * width
        : MediaQuery.of(context).size.width * width;
