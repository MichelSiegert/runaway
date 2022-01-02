import 'package:flutter/material.dart';

class SidebarEntry extends StatelessWidget {
  final String name, route;

  const SidebarEntry({Key? key, required this.name, required this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      title: Text(name),
    );
  }
}
