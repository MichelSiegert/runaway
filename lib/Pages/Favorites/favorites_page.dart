import 'package:flutter/material.dart';

import 'favorites_scaffold.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return favoriteScaffold(title, context);
  }
}
