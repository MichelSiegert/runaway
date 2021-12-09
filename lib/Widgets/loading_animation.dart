import 'package:flutter/material.dart';

Future loadingAnimation(BuildContext context) => showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            child:SizedBox(
              //TODO make this not hard coded!
            height:100,
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
              CircularProgressIndicator(),
              Text("loading")
            ])));
      },
    );
