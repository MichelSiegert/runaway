import 'package:flutter/material.dart';

import 'Pages/Location/locations_page.dart';
import 'Pages/Login/login_page.dart';
import 'Pages/Menu/menu_page.dart';
import 'Pages/Settings/settings_page.dart';

void main() => runApp(MaterialApp(routes: {
      '/menu': (context) => const MenuPage(title: 'Runaway'),
      '/settings': (context) => const SettingsPage(title: "Runaway"),
      '/locations': (context) => const LocationsPage(title: "Runaway"),
      '/': (context) => const LoginPage(title: "Runaway")
    }));

class RunAway extends StatelessWidget {
	const RunAway({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return const MaterialApp(
			title: 'Runaway',
			home: MenuPage(title: 'Runaway'),
		);
	}
}