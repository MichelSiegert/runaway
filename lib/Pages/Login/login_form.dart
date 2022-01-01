import 'package:away/Logic/authentication.dart';
import 'package:away/Widgets/loading_animation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String email = "", password = "";
    final AuthService _authent = AuthService();
    final List<Widget> elements = [];
    elements.add(TextField(
      onChanged: (text) {
        email = text;
      },
      obscureText: false,
      decoration: const InputDecoration(
          border: OutlineInputBorder(), labelText: "Username"),
    ));
    elements.add(Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        obscureText: true,
        decoration: const InputDecoration(
            border: OutlineInputBorder(), labelText: "Passwort"),
        onChanged: (text) {
          password = text;
        },
      ),
    ));
    elements.add(Column(children: <Widget>[
      Container(
        padding: const EdgeInsets.all(10),
        child: TextButton(
          child: const Text("login"),
          onPressed: () async {
            loadingAnimation(context);

            final user = await _authent.login(email, password);
            Navigator.pop(context); //pop dialog

            if (user.runtimeType != UserCredential) {
              print("something went wrong!");
            } else {
              Navigator.pushNamed(context, "/menu");
            }
          },
        ),
      ),
      Container(
        padding: const EdgeInsets.all(10),
        child: TextButton(
          child: const Text("login anonymously"),
          onPressed: () async {
            loadingAnimation(context);
            User? user = await _authent.signInAnon();
            Navigator.pop(context);
            if (user == null) {
              print("something went wrong!");
            } else {
              Navigator.pushNamed(context, "/menu");
            }
          },
        ),
      ),
      Container(
        padding: const EdgeInsets.all(10),
        child: TextButton(
          child: const Text("No Account? Register here!"),
          onPressed: () {
            Navigator.pushNamed(context, "/register");
          },
        ),
      ),
      Container(
        padding: const EdgeInsets.all(10),
        child: TextButton(
          child: const Text("Sign in with Google!"),
          onPressed: () async {
            _authent.signInWithGoogle().then((user) {
              if (user == null) {
                print("something went wrong!");
              } else {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/menu");
              }
            });
            loadingAnimation(context);
          },
        ),
      ),
    ]));

    return SizedBox.expand(
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: elements),
      ),
    );
  }
}
