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

Future<void> LanguageToDb(String language) async {
  final DatabaseReference database = FirebaseDatabase.instance.ref();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User us = auth.currentUser!;
  final String uid = us.uid;

  final DatabaseReference reference =
  database.child("/users/$uid/settings/language");
  reference.set({"lang": language});
}

Future<void> LanguageDisplayToDb(String display) async {
  final DatabaseReference database = FirebaseDatabase.instance.ref();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User us = auth.currentUser!;
  final String uid = us.uid;

  final DatabaseReference reference =
  database.child("/users/$uid/settings/languageDisplay");
  reference.set({"display": display});
}

Future<void> MetricToDb(String metric) async {
  final DatabaseReference database = FirebaseDatabase.instance.ref();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User us = auth.currentUser!;
  final String uid = us.uid;

  final DatabaseReference reference =
  database.child("/users/$uid/settings/metrics");
  reference.set({"metric": metric});
}