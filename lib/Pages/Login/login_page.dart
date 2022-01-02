import 'package:away/Pages/Login/future_login.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {

  const LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return const FutureLogin();
  }
}
