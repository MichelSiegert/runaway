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
                  title: const Text("Runaway"),
                  backgroundColor: Colors.green,
                ),
                body: const LoginForm());
          } else if (snapshot.hasError) {
            return const Text("A CRITICAL ERROR HAS OCCURRED!");
          } else {
            return SizedBox.expand(
                child: Container(
                    color: Colors.lightGreen,
                    child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text('Willkommen bei Runaway', textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    blurRadius: 10.0,
                                    color: Colors.blueGrey,
                                    offset: Offset(5.0, 5.0),
                                  ),
                                  Shadow(
                                    color: Colors.black26,
                                    blurRadius: 10.0,
                                    offset: Offset(-5.0, 5.0),
                                  ),
                                ],
                                decoration: TextDecoration.none,
                              )),
                              Image.asset('lib/Images/RegenWolke.png'),
                          const CircularProgressIndicator(),
                        ]))));
          }
        });
  }

  Future _doTheLoading() {
    return Future.delayed(
        const Duration(seconds: 3), () => Firebase.initializeApp());
  }
}
