import 'package:flutter/material.dart';

import 'form.dart';

class RegisterPage extends StatelessWidget {
   const RegisterPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return registerScaffold("Register", context);
  }

  Scaffold registerScaffold(String s, BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text(s),
      ),
      body:RegisterForm()
    );
  }
}
