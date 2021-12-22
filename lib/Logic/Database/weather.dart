import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
// this page is for storing information regarding the weather
void tapWeatherCardToDataBase(String place) async {
  final DatabaseReference database = FirebaseDatabase.instance.ref();
  final String uid = FirebaseAuth.instance.currentUser!.uid;
  //TODO ich weiß nicht wie man solche datenbanken ordentlich modelliert!
  final DatabaseReference reference =
      database.child("/users/$uid/favorites/$place");
  final DatabaseEvent getData = await reference.once();
  if (getData.snapshot.value == null) {
    reference.set(place);
  } else {
    reference.set(null);
  }
}

Future isThisPlaceAFavoriteOfUser(String place) async {
  final DatabaseReference database = FirebaseDatabase.instance.ref();
  final String uid = FirebaseAuth.instance.currentUser!.uid;
  final DatabaseReference reference =
      database.child("/users/$uid/favorites/$place");
  final DatabaseEvent getData = await reference.once();
  bool result = !(getData.snapshot.value == null);
  return result;
}

Future allFavoritePlacesOfUser() async {
  final DatabaseReference database = FirebaseDatabase.instance.ref();
  final String uid = FirebaseAuth.instance.currentUser!.uid;
  final DatabaseReference reference = database.child("/users/$uid/favorites/");
  final DatabaseEvent getData = await reference.once();
  var test = getData.snapshot.value! as Map<Object?, Object?>;
  List<String> places = [];
  test.forEach((key, value) {
    places.add(value as String);
  });
  return places;
}
