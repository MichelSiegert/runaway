import 'package:away/Logic/authentication.dart';
import 'package:away/Widgets/loading_animation.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({Key? key}) : super(key: key);
  String password = "";
  String mail = "";

  @override
  Widget build(BuildContext context) => SizedBox.expand(
        child: Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          color: Colors.white,
          child: Column(
            children: [
              TextField(
                onChanged: (text) {
                  mail = text;
                },
                obscureText: false,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Email"),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  onChanged: (text) {
                    password = text;
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Passwort"),
                ),
              ),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(primary: Colors.blueGrey[900]),
                  child: const Text("Register"),
                  onPressed: () async {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => LoadingDialog());
                    AuthService auth = AuthService();
                    await auth.register(mail, password);
                    Navigator.pushNamed(context, "/");
                  }),
            ],
          ),
        ),
      );
}
