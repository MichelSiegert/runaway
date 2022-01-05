import 'package:away/Logic/screen_size_calculator.dart';
import 'package:flutter/material.dart';

class LoginLine extends StatelessWidget {
  final Widget dropdown;
  final String text;

  const LoginLine({Key? key, required this.dropdown, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        width: calculateWidth(1, context),
        height: calculateHeight(0.1, context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [Text(text), dropdown],
        ),
      );
}
