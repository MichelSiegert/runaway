import 'package:away/Widgets/sidebar/sidebar.dart';
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
                            navigateAfterSeconds: const AfterSplash(),
                            title: const Text('Willkommen bei Runaway',textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0)),
                            image: Image.asset(
                              'lib/Images/regen_wolke.png'),
                            photoSize: 150.0,
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

class AfterSplash extends StatelessWidget {
  const AfterSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Willkommen im SplashScreen Package"),
        automaticallyImplyLeading: false,
      ),
      body: const Center(
          child: Text("Erfolgreich",
              style: TextStyle(fontWeight: FontWeight.bold))),
    );
  }
}
