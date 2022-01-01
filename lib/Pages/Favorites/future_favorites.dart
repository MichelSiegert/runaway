import 'package:away/Logic/Database/weather.dart';
import 'package:away/Widgets/load_scaff.dart';
import 'package:flutter/material.dart';

import 'favorite_scaffold.dart';

class FutureFavorite extends StatelessWidget {
  const FutureFavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getListOfFavorites(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return FavoriteScaffold(places: snapshot.data as List<String>);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return const LoadingScaffold();
        }
      },
    );
  }

  Future _getListOfFavorites() async {
    return await allFavoritePlacesOfUser();
  }
}
