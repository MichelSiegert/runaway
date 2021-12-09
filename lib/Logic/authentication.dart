import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


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

//TODO instead of print calls, use Widgets.
  Future login(final String email, final String password) async {
    UserCredential? user;
    try {
       user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("no user with such an email!");
      } else if (e.code == "wrong-password") {
        print("Wrong password!");
      }
    }
    //TODO not null, this is not a good practice.
    return user;
  }

//TODO instead of printcalls use widgets.
  Future Register(final String email, final String password) async {
    try {
      UserCredential userCred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return userCred;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('the password is too weak');
      } else if (e.code == 'email-already-in-use') {
        print('the account already exists for that email!');
      }
    } catch (e) {
      print(e);
    }
    //TODO NULL is bad practice.
    return null;
  }

  Future signOut() async {
    return await FirebaseAuth.instance.signOut();
  }

//TODO GOOGLE AUTHENTICATOR
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
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
