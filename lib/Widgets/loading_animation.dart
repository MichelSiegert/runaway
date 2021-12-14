import 'package:flutter/material.dart';

Future loadingAnimation(BuildContext context) => showDialog(
    context: context,
    builder: (BuildContext context) => Dialog(
        child: SizedBox(
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * 0.3
                : MediaQuery.of(context).size.width * 0.3,
            child: Column(
                // max = the height of the sizedbox in this case.
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  Text("loading")
                ]))));
