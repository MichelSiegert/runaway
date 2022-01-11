import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
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
                appBar: AppBar(
                  title: const Text("Runaway"),
                  backgroundColor: Colors.blueGrey[900],
                ),
                body: const LoginForm());
          } else if (snapshot.hasError) {
            return const Text("A CRITICAL ERROR HAS OCCURRED!");
          } else {
            return SizedBox.expand(
                child: Container(
                    color: Colors.blueGrey[900],
                    child: SplashScreen(
                      seconds: 14,
                      navigateAfterSeconds: const FutureLogin(),
                      title: Text('Willkommen bei Runaway',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).orientation ==
                                      Orientation.portrait
                                  ? 40.0
                                  : 20.0)),
                      image: Image.asset('lib/Images/regen_wolke.png'),
                      photoSize: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 150.0
                          : 100,
                      backgroundColor: Colors.blueGrey[900],
                      loaderColor: Colors.blue,
                    )));
          }
        });
  }

  Future _doTheLoading() {
    return Future.delayed(
        const Duration(seconds: 3), () => Firebase.initializeApp());
  }
}
