import 'package:away/Logic/authentication.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
   const RegisterPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return RegisterScaffold("Register", context);
  }

  Scaffold RegisterScaffold(String s, BuildContext context) {
    String mail = "";
    String password = "";

    return Scaffold(
      appBar: AppBar(
        title: Text(s),
      ),
      body: SizedBox.expand(
        child: Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: Column(
            children: [
               TextField(
                onChanged: (text)
                {
                  mail = text;
                },
                obscureText: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Username"),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child:  TextField(
                  onChanged: (text) {password = text;},
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Passwort"),
                ),
              ),
              TextButton(
                  onPressed: () {
                    AuthService auth = AuthService();
                    auth.Register(mail, password);
                    Navigator.pushNamed(context, "/");
                  },
                  child: const Text("Register"))
            ],
          ),
        ),
      ),
    );
  }
}
