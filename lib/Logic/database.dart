import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

fun() async {
  DatabaseReference database = FirebaseDatabase.instance.ref();
  FirebaseAuth auth = FirebaseAuth.instance;
  final User? us = auth.currentUser;
  String uid = us!.uid;
  DatabaseReference reference = database.child("/users/$uid");
  reference
      .set({"does this work": "maybe", "will we see that?": "yes!"})
      .then((value) => print("nice"))
      .catchError((value) => print("ohno"));
}
