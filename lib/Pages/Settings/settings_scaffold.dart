import '../../Widgets/sidebar.dart';
import 'package:flutter/material.dart';

//
Scaffold settingScaffold(final String title, BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.green,
      ),
      //Text in the middle of the page
      body: const Center(
        child: Text('Settings hinzufügen'),
      ),
      //Menu Sidebar
      drawer: createSidebar(context),
    );
