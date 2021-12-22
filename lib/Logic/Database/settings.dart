import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

Future<void> writeSettingsToDatabase(String setting, String value) async {
  final DatabaseReference database = FirebaseDatabase.instance.ref();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User us = auth.currentUser!;
  final String uid = us.uid;

  final DatabaseReference reference =
      database.child("/users/$uid/settings/$setting");
  reference.set({"lang": value});
}

Future<bool> doesUserExist() async {
  final String uid = FirebaseAuth.instance.currentUser!.uid;
  final DatabaseReference reference =
      FirebaseDatabase.instance.ref().child("/users/$uid");
  final DatabaseEvent data = await reference.once();
  return !(null == data.snapshot.value);
}

// should never even happen!
Future<bool> doesUserHaveSettings() async {
  final String uid = FirebaseAuth.instance.currentUser!.uid;
  final DatabaseReference reference =
      FirebaseDatabase.instance.ref().child("/users/$uid/settings");
  final DatabaseEvent data = await reference.once();
  return !(null == data.snapshot.value);
}

void setupUser() {
  final String uid = FirebaseAuth.instance.currentUser!.uid;
  final DatabaseReference reference =
      FirebaseDatabase.instance.ref().child("/users/$uid/settings/");
  reference.child("/lang/").set("en");
  reference.child("/typo/").set("lat");
  reference.child("/unit/").set("metric");
}

Future<String> getSettings(String setting) async {
  final String uid = FirebaseAuth.instance.currentUser!.uid;
  final DatabaseReference reference =
      FirebaseDatabase.instance.ref().child("/users/$uid/settings/$setting/");
  var snap = await reference.once();
  print(snap.snapshot.value);
  return snap.snapshot.value as String;
}

void setSettings(String setting, String newVal) {
  final String uid = FirebaseAuth.instance.currentUser!.uid;
  final DatabaseReference reference =
      FirebaseDatabase.instance.ref().child("/users/$uid/settings/$setting/");
  reference.set(newVal);
}
