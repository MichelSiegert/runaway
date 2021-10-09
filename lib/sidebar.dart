import 'package:flutter/material.dart';

Drawer createSidebar(BuildContext context)
{
 return Drawer(
   //ListView
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.green,
          ),
          child: Text('Menü'),
        ),
        //List of the menu without continuation to other pages
        ListTile(
          title: const Text('Startseite'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('Meine Standorte'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('Einstellungen'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}