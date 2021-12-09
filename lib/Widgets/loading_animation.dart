import 'package:flutter/material.dart';

Future loadingAnimation(BuildContext context) => showDialog(
    context: context,
    builder: (BuildContext context) => Dialog(
        child: SizedBox(
            //TODO make this not hard coded!
            height: 100,
            child: Column(
              // max = the height of the sizedbox in this case.
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  Text("loading")
                ]))));
