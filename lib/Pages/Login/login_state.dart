import 'package:away/Pages/Login/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'login_scaffold.dart';

class LoginState extends State<LoginPage> {
  bool _initialized = false;
  bool _error = false;

  @override
  Widget build(BuildContext context) {
    if (_error) {
      return Text("something went wrong!");
    } else if (_initialized) {
      //TODO IMPLEMENT ROUTE
      return LoginScaffold("Runaway", context);
    } else {
      return Text("Loading Runaway...");
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }
}
