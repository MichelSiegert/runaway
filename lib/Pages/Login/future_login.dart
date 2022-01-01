import 'package:away/Widgets/sidebar/sidebar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'login_form.dart';

class FutureLogin extends StatelessWidget {
  const FutureLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _doTheLoading(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              drawer: const Sidebar(),
                appBar: AppBar(
                  title: const Text("runaway"),
                  backgroundColor: Colors.green,
                ),
                body: const LoginForm());
          } else if (snapshot.hasError) {
            return const Text("A CRITICAL EROOR HAS OCCURED!");
          } else {
            return SizedBox.expand(
                child: Container(
                    color: Colors.white,
                    child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                          CircularProgressIndicator(),
                          Text("loading runaway")
                        ]))));
          }
        });
  }

  Future _doTheLoading() {
    return Future.delayed(
        const Duration(seconds: 3), () => Firebase.initializeApp());
  }
}
