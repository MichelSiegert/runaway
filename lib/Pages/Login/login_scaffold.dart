
import 'package:away/Pages/Login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

FutureBuilder buildLogin(BuildContext context) =>
    FutureBuilder(
        future: doTheLoading(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
                appBar: AppBar(
                  title: const Text("runaway"),
                  backgroundColor: Colors.green,
                ),
                body: SizedBox.expand(
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: createLoginForm(context)),
                  ),
                ));
          } else if (snapshot.hasError) {
            return const Text("A CRITICAL EROOR HAS OCCURED!");
          } else {
            return SizedBox.expand(
                child: Container(
                  color: Colors.white,
                child:Center(
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const[CircularProgressIndicator(),Text("loading runaway")]))));
        }
        });

Future doTheLoading() {
  return Future.delayed(
      const Duration(seconds: 3), () => Firebase.initializeApp());
}