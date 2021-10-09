import 'package:flutter/material.dart';

import 'menu_scaffold.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return mainScaffold(title,context);
  }
}