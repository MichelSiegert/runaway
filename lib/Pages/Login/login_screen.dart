import 'package:away/Logic/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

List<Widget> createLoginForm(BuildContext context) {
  String email = "", password = "";
  AuthService _authent = AuthService();
  List<Widget> elements = [];
  elements.add(TextField(
    onChanged: (text) {
      email = text;
    },
    obscureText: false,
    decoration:
        const InputDecoration(border: OutlineInputBorder(), labelText: "Username"),
  ));
  elements.add(Container(
    padding: const EdgeInsets.all(10),
    child: TextField(
      obscureText: true,
      decoration:
          const InputDecoration(border: OutlineInputBorder(), labelText: "Passwort"),
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
          UserCredential? user = await _authent.login(email, password);
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
        child: const Text("login anonymously"),
        onPressed: () async {
          User? user = await _authent.signInAnon();
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
          UserCredential user = await _authent.signInWithGoogle();
          if (user == null) {
            print("something went wrong!");
          } else {
            Navigator.pushNamed(context, "/menu");
          }
        },
      ),
    ),
  ]));

  return elements;
}
