import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

//this code is necessary for saving and loading favorite places of the user.
// it does reading and writing.
//there is also a boolean check to see, if the user already has liked this place.

void tapWeatherCardToDataBase(String place, String lat, String lon) async {
  String key = (place+lat+lon).replaceAll(".", "");
  final DatabaseReference database = FirebaseDatabase.instance.ref();
  final String uid = FirebaseAuth.instance.currentUser!.uid;
  final DatabaseReference reference =
      database.child("/users/$uid/favorites/$key");
  final DatabaseEvent getData = await reference.once();
  if (getData.snapshot.value == null) {
    reference.set("$place");
  } else {
    reference.set(null);
  }
}

Future isThisPlaceAFavoriteOfUser(String place, String lat, String lon) async {
  String key = (place+lat+lon).replaceAll(".", "");
  print(key);
  final DatabaseReference database = FirebaseDatabase.instance.ref();
  final String uid = FirebaseAuth.instance.currentUser!.uid;
  final DatabaseReference reference =
      database.child("/users/$uid/favorites/$key/");
  final DatabaseEvent getData = await reference.once();
  bool result = !(getData.snapshot.value == null);
  return result;
}

Future allFavoritePlacesOfUser() async {
  final DatabaseReference database = FirebaseDatabase.instance.ref();
  final String uid = FirebaseAuth.instance.currentUser!.uid;
  final DatabaseReference reference = database.child("/users/$uid/favorites/");
  final DatabaseEvent getData = await reference.once();
  if (getData.snapshot.value == null) {
    return "";
  }
  var test = getData.snapshot.value! as Map<Object?, Object?>;
  List<String> places = [];
  test.forEach((key, value) {
    places.add(value as String);
  });
  return places;
}
