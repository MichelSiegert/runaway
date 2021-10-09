import 'package:away/sidebar.dart';
import 'package:flutter/material.dart';

//
Scaffold locationScaffold( final String title, BuildContext context) => Scaffold(
  appBar: AppBar(
    title: Text(title),
    backgroundColor: Colors.green,
  ),
  //Text in the middle of the page
  body: Center(
    child:SizedBox.expand(
      child: ListView(
        children: populateListView(context)
      ),
    )
  ),
  //Menu Sidebar
  drawer: createSidebar(context),
);


List<ListTile> populateListView(BuildContext context) {
  List<ListTile> elemente = [];
  List<int> liste= [];
  [for (int i=0; i<50; i++) liste.add(i)];
  for (int zahl in liste) {
    elemente.add(createTile(zahl, context));
  }
  return elemente;
}

ListTile createTile(final int inhalt, BuildContext context) => ListTile(
  title: Text(inhalt.toString()),
);