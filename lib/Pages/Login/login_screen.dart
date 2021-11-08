import 'package:away/Logic/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

List<Widget> createLoginForm(BuildContext context ) {
  AuthService _authent = AuthService();
  List<Widget> elements = [];
  elements.add(const TextField(
    obscureText: false,
    decoration:
        InputDecoration(border: OutlineInputBorder(), labelText: "Username"),
  ));
  elements.add(Container(
    padding: const EdgeInsets.all(10),
    child: const TextField(
      obscureText: true,
      decoration:
          InputDecoration(border: OutlineInputBorder(), labelText: "Passwort"),
    ),
  ));

  elements.add(Row(children: <Widget>[
    Container(
      padding: const EdgeInsets.all(10),
      child: TextButton(
        child: const Text("login with form"),
        onPressed: () {},
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
  ]));

  return elements;
}
