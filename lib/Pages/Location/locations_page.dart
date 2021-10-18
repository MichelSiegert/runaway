import 'package:flutter/material.dart';

import 'locations_scaffold.dart';

class LocationsPage extends StatelessWidget {
  const LocationsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return locationScaffold(title, context);
  }
}
