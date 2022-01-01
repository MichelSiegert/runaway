import 'package:away/Logic/authentication.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({Key? key}) : super(key: key);
  String password = "";
  String mail = "";

  @override
  Widget build(BuildContext context) => SizedBox.expand(
        child: Container(
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
                    border: OutlineInputBorder(), labelText: "Username"),
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
              TextButton(
                  onPressed: () async {
                    AuthService auth = AuthService();
                    await auth.register(mail, password);
                    Navigator.pushNamed(context, "/");
                  },
                  child: const Text("Register"))
            ],
          ),
        ),
      );
}
