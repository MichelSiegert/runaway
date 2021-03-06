import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'Database/settings.dart';

//this class solves every issue regarding login and registration.

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInAnon() async {
    try {
      final UserCredential result = await _auth.signInAnonymously();
      final User? user = result.user;
      generateSettings();
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future login(final String email, final String password) async {
    try {
      UserCredential user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      generateSettings();
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        return "No user with such an email!";
      } else if (e.code == "wrong-password") {
        return "Wrong password!";
      }
      return e.code;
    }
  }

  Future register(final String email, final String password) async {
    try {
      final UserCredential userCred = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCred;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'the password is too weak';
      } else if (e.code == 'email-already-in-use') {
        return 'the account already exists for that email!';
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future signOut() async {
    return await FirebaseAuth.instance.signOut();
  }

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    UserCredential user =
        await FirebaseAuth.instance.signInWithCredential(credential);
    setupUser();
    return user;
  }

  void generateSettings() async {
    if (!await doesUserExist()) {
      setupUser();
    }
  }
}
