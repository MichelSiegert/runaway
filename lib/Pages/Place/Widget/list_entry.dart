import 'package:flutter/material.dart';

class ListEntry extends StatelessWidget {
  final String text, value;

  const ListEntry({required this.text, required this.value, Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(text), Text(value)],
      );
}
