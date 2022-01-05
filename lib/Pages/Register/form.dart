import 'package:away/Logic/authentication.dart';
import 'package:away/Widgets/loading_animation.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textCon = TextEditingController();
    TextEditingController passCon = TextEditingController();
    return SizedBox.expand(
      child: Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        color: Colors.white,
        child: Column(
          children: [
            TextField(
              onChanged: (text) {},
              controller: textCon,
              obscureText: false,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Email"),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Passwort"),
                controller: passCon,
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.blueGrey[900]),
                child: const Text("Register"),
                onPressed: () async {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => LoadingDialog());
                  AuthService auth = AuthService();
                  await auth.register(textCon.text, passCon.text);
                  Navigator.pushNamed(context, "/");
                }),
          ],
        ),
      ),
    );
  }
}
