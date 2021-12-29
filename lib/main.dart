import 'package:flutter/material.dart';

import 'Pages/Favorites/favorites_page.dart';
import 'Pages/Login/login_page.dart';
import 'Pages/Menu/menu_page.dart';
import 'Pages/Place/place_page.dart';
import 'Pages/Register/register_page.dart';
import 'Pages/Settings/settings_page.dart';

void main() => runApp(MaterialApp(routes: {
      '/menu': (context) => const MenuPage(title: 'Runaway'),
      '/settings': (context) => const SettingsPage(title: "Runaway"),
      '/locations': (context) => const FavoritesPage(title: "Runaway"),
      '/register': (context) => const RegisterPage(title: "Runaway"),
      "/onePlace": (context) => const OnePlace(title: '',),
      '/': (context) => const LoginPage(title: "Runaway")
    }));
