import 'login_screen.dart';
import 'package:flutter/material.dart';


Scaffold LoginScaffold(final String title, BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.green,
      ),
      body: SizedBox.expand(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: createLoginForm(context)),
        ),
      ),
    );
