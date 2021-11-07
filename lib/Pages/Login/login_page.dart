import 'package:flutter/material.dart';

import 'login_scaffold.dart';
import 'login_state.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return LoginScaffold(title, context);
  }

  @override
  State<StatefulWidget> createState() => LoginState();

}
