import 'package:flutter/material.dart';

Future loadingAnimation(BuildContext context) =>
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [CircularProgressIndicator(),
              Text("loading")]
          )
        );
      },
    );

