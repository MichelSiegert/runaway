import 'package:flutter/material.dart';

import 'menu_scaffold.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key, required this.title}) : super(key: key);

  static const int numEntries = 50;
  final String title;

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
