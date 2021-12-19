import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

void tapWeatherCardToDataBase(String place) async {
  final DatabaseReference database = FirebaseDatabase.instance.ref();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User us = auth.currentUser!;
  final String uid = us.uid;
  //TODO ich weiß nicht wie man solche datenbanken ordentlich modelliert!
  final DatabaseReference reference =
      database.child("/users/$uid/favorites/$place");
  final DatabaseEvent getData = await reference.once();
  if (getData.snapshot.value == null) {
    reference.set({place: "isFavorite"});
  } else {
    reference.set(null);
  }
}

Future isThisPlaceAFavoriteOfUser(String place) async {
  final DatabaseReference database = FirebaseDatabase.instance.ref();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User? us = auth.currentUser;
  final String uid = us!.uid;
  final DatabaseReference reference =
  database.child("/users/$uid/favorites/$place");
  final DatabaseEvent getData = await reference.once();
  bool result = !(getData.snapshot.value == null);
  return result;
}

Future<void> writeSettingsToDatabase(String setting, String value) async {
  final DatabaseReference database = FirebaseDatabase.instance.ref();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User us = auth.currentUser!;
  final String uid = us.uid;

  final DatabaseReference reference =
  database.child("/users/$uid/settings/$setting");
  reference.set({"lang": value});
}
