import 'package:away/Widgets/sidebar/sidebar_entry.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> elemente = [];
    elemente.add(const DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.green,
      ),
      child: Text('Menü'),
    ));
    <String, String>{
      "Locations": "/menu",
      "My Locations": "/locations",
      "Settings": "/settings",
    }.forEach((key, value) {
      elemente.add(SidebarEntry(name: key, route: value));
    });
    elemente.add(ListTile(
      onTap: () async {
        final FirebaseAuth auth = FirebaseAuth.instance;
        await auth.signOut();
        Navigator.pushNamed(context, "/");
      },
      title: const Text("Logout"),
      subtitle: const Text("to go back to login!"),
    ));
    return Drawer(
      //ListView
      child: ListView(
        padding: EdgeInsets.zero,
        children: elemente,
      ),
    );
  }
}
