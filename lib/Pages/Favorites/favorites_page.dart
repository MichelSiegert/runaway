import 'package:flutter/material.dart';

import 'future_favorites.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return const FutureFavorite();
  }
}
