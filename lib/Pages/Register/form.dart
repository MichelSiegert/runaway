import 'package:away/Logic/authentication.dart';
import 'package:away/Widgets/loading_animation.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textCon = TextEditingController();
    TextEditingController passCon = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              onChanged: (text) {},
              controller: textCon,
              obscureText: false,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Email"),
            ),
            SizedBox(height: 8,),
            Container(
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
