import 'package:flutter/material.dart';

import 'menu_page.dart';

void main() => runApp(const MyApp());

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

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  //Green upper bar with menu
  Widget build(BuildContext context) {
    return mainScaffold(title,context);
  }
}
