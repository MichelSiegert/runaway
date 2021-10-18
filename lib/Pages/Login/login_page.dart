import 'package:flutter/material.dart';

import 'login_scaffold.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return loginScaffold(title, context);
  }
}
