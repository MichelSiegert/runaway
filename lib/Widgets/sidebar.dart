import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Drawer createSidebar(BuildContext context) {
  final seiten = {
    "Startseite": "/menu",
    "Meine Standorte": "/locations",
    "Einstellungen": "/settings",
  };
  return Drawer(
    //ListView
    child: ListView(
      padding: EdgeInsets.zero,
      children: populateBody(context, seiten),
    ),
  );
}

List<Widget> populateBody(BuildContext context, final Map<String, String> map) {
  final List<Widget> elemente = [];
  final FirebaseAuth auth = FirebaseAuth.instance;

  elemente.add(createHeader(context));
  map.forEach((key, val) => elemente.add(createTile(key, context, val)));
  elemente.add(ListTile(
    onTap: () async {
      await auth.signOut();
      Navigator.pushNamed(context,"/");
    },
    title: const Text("Logout"),
    subtitle: const Text("to go back to login!"),
  )
  );
  return elemente;
}

Widget createHeader(BuildContext context) => const DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.green,
      ),
      child: Text('Menü'),
    );

Widget createTile(final String key, BuildContext context, final value) =>
    ListTile(
      onTap: () {
        Navigator.pushNamed(context, value);
      },
      title: Text(key),
    );
