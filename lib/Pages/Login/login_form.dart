import 'package:away/Logic/authentication.dart';
import 'package:away/Logic/screen_size_calculator.dart';
import 'package:away/Widgets/loading_animation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textCon = TextEditingController();
    TextEditingController passCon = TextEditingController();
    final AuthService _authent = AuthService();
    final List<Widget> elements = [];

    elements.add(SizedBox(
        width: calculateWidth(0.6, context),
        height: calculateHeight(0.1, context),
        child: TextField(
          controller: textCon,
          obscureText: false,
          decoration: const InputDecoration(
              border: OutlineInputBorder(), labelText: "Email"),
        )));

    elements.add(
      TextField(
        obscureText: true,
        decoration: const InputDecoration(
            border: OutlineInputBorder(), labelText: "Passwort"),
        controller: passCon,
      ),
    );

    elements.add(Column(children: <Widget>[
      ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.blueGrey[900]),
        child: const Text("login"),
        onPressed: () async {
          showDialog(
              context: context,
              builder: (BuildContext context) => LoadingDialog());

          final user = await _authent.login(textCon.text, passCon.text);
          Navigator.pop(context); //pop dialog
          if (user.runtimeType != UserCredential) {
            showAlertDialog(context, user);
          } else {
            Navigator.pushNamed(context, "/menu");
          }
        },
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.blueGrey[900]),
        child: const Text("login anonymously"),
        onPressed: () async {
          showDialog(
              context: context,
              builder: (BuildContext context) => LoadingDialog());
          User? user = await _authent.signInAnon();
          Navigator.pop(context);
          if (user == null) {
            showAlertDialog(context, "Failed to sign in anon!");
          } else {
            Navigator.pushNamed(context, "/menu");
          }
        },
      ),
      ElevatedButton(
          child: const Text("No Account? Register here!"),
          style: ElevatedButton.styleFrom(primary: Colors.blueGrey[900]),
          onPressed: () {
            Navigator.pushNamed(context, "/register");
          }),
      SignInButton(
        Buttons.GoogleDark,
        onPressed: () async {
          _authent.signInWithGoogle().then((user) {
            if (user == null) {
              showAlertDialog(context, "failed to sign in with google!");
            } else {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/menu");
            }
          });
          showDialog(
              context: context,
              builder: (BuildContext context) => LoadingDialog());
        },
      ),
    ]));

    return SizedBox.expand(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: ListView(children: elements),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context, String text) {
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  AlertDialog alert = AlertDialog(
    title: Text(text, style: TextStyle(color: Colors.red)),
    actions: [
      okButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
