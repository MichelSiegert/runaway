import 'package:flutter/cupertino.dart';

class OnePlace extends StatefulWidget {
  const OnePlace({Key? key, required String title}) : super(key: key);

  @override
  OnePlaceState createState() => OnePlaceState();
}

class OnePlaceState extends State<OnePlace> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    return Text(args);
  }
}
