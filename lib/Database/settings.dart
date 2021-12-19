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
  return null == data.snapshot.value;
}

void setupUser() {
  final String uid = FirebaseAuth.instance.currentUser!.uid;
  final DatabaseReference reference =
      FirebaseDatabase.instance.ref().child("/users/$uid/settings/");
  reference.child("/lang/").set({"lang": "eng"});
  reference.child("/typo/").set({"write": "lat"});
  reference.child("/unit/").set({"unit": "Celsius"});
}
