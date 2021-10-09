import 'package:flutter/material.dart';

import 'locations_page.dart';
import 'menu_page.dart';
import 'settings_page.dart';

Drawer createSidebar(BuildContext context)
{
  final seiten = ["Startseite", "Meine Standorte", "Einstellungen"];
 return Drawer(
   //ListView
    child: ListView(
      padding: EdgeInsets.zero,
      children: populateBody(context,seiten),
    ),
  );
}


List<Widget> populateBody(BuildContext context, final List<String> titel) {
  List<Widget> elemente = [];
  elemente.add(createHeader(context));
  for (final text in titel) {
    elemente.add(createTile(text, context));
  }
  return elemente;
}

Widget createHeader(BuildContext context)=> const DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.green,
      ),
      child: Text('Menü'),
    );

Widget createTile(final String inhalt, BuildContext context) => ListTile(
    onTap: () {
      Navigator.push(context, doRouting(inhalt, context));
    },
    title: Text(inhalt),
  );


MaterialPageRoute doRouting(final inhalt, BuildContext context)
{
  if (inhalt =="Menü") {return MaterialPageRoute(builder:(_) => const MyHomePage(title: "Runaway"));}
  else if (inhalt =="Einstellungen") {return MaterialPageRoute(builder:(_) => const MySettings(title: "Runaway"));}
  else  {return MaterialPageRoute(builder:(_) => const Locations(title: "Runaway"));}
}