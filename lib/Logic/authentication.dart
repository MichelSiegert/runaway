import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // TODO sign in anon
  //shoul work?
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//TODO sign in email password

//TODO register with mail password

//TODO Sign out
// good enough??
  Future signOut() async {
    return await FirebaseAuth.instance.signOut();
  }

//TODO GOOGLE AUTHENTICATOR
}
