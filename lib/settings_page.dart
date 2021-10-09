import 'package:flutter/material.dart';

import 'menu_Scaffold.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return mainScaffold(title,context);
  }
}