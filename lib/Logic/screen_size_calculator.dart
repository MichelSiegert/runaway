import 'package:flutter/cupertino.dart';

//this file is for increased usability. it changes the layout of the file based
//on the landscape or portrait mode. note that it is not beautiful, it was merely there
//to show off that this is possible.
double calculateHeight(double height, BuildContext context) =>
    MediaQuery.of(context).orientation == Orientation.portrait
        ? MediaQuery.of(context).size.height * height
        : MediaQuery.of(context).size.width * height;

//berchnet die weite des Widgets unterschiedlich im Landscape/Portrait modus.
double calculateWidth(double width, BuildContext context) =>
    MediaQuery.of(context).orientation == Orientation.portrait
        ? MediaQuery.of(context).size.height * width
        : MediaQuery.of(context).size.width * width;
