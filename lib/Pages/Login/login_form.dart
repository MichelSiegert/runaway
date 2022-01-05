import 'package:away/Logic/authentication.dart';
import 'package:away/Widgets/loading_animation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

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
          border: OutlineInputBorder(), labelText: "Email"),
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
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.blueGrey[900]),
          child: const Text("login"),
          onPressed: () async {
            showDialog(
                context: context,
                builder: (BuildContext context) => LoadingDialog());

            final user = await _authent.login(email, password);
            Navigator.pop(context); //pop dialog
            if (user.runtimeType != UserCredential) {
              showAlertDialog(context);
            } else {
              Navigator.pushNamed(context, "/menu");
            }
          },
        ),
      ),
      Container(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.blueGrey[900]),
          child: const Text("login anonymously"),
          onPressed: () async {
            showDialog(
                context: context,
                builder: (BuildContext context) => LoadingDialog());
            User? user = await _authent.signInAnon();
            Navigator.pop(context);
            if (user == null) {
              showAlertDialog(context);
            } else {
              Navigator.pushNamed(context, "/menu");
            }
          },
        ),
      ),
      Container(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
            child: const Text("No Account? Register here!"),
            style: ElevatedButton.styleFrom(primary: Colors.blueGrey[900]),
            onPressed: () {
              Navigator.pushNamed(context, "/register");
            }),
      ),
      SignInButton(
        Buttons.GoogleDark,
        padding: const EdgeInsets.all(10),
        onPressed: () async {
          _authent.signInWithGoogle().then((user) {
            if (user == null) {
              showAlertDialog(context);
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
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: elements),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  AlertDialog alert = AlertDialog(
    title: const Text("Something went wrong!",
        style: TextStyle(color: Colors.red)),
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
