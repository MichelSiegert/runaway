import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

fun() async {
  final DatabaseReference database = FirebaseDatabase.instance.ref();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User? us = auth.currentUser;
  final String uid = us!.uid;
  final DatabaseReference reference = database.child("/users/$uid");
  reference
      .set({"does this work": "maybe", "will we see that?": "yes!"})
      .then((value) => print("nice"))
      .catchError((value) => print("ohno"));
}
