import 'package:away/Logic/Database/weather.dart';
import 'package:away/Widgets/load_scaff.dart';
import 'package:away/Widgets/sidebar/sidebar.dart';
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
          if (snapshot.data == "")
            return Scaffold(
              appBar: AppBar(
                title: const Text("Runaway"),
                backgroundColor: Colors.blueGrey[900],
              ),
              body: SizedBox.expand(
                  child: Center(
                child: Text("you have no favorites selected yet!"),
              )),
              drawer: const Sidebar(),
            );
          else
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
