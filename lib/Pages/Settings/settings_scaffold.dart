import 'package:away/Pages/Settings/settingsDropDownWidgets/unit_system.dart';
import 'package:away/Widgets/sidebar.dart';

import 'settingsDropDownWidgets/language.dart';
import 'settingsDropDownWidgets/language_display.dart';
import 'package:flutter/material.dart';

//
Scaffold settingScaffold(final String title, BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.green,
      ),
      //Text in the middle of the page
      body: Container(
        padding: const EdgeInsets.all(16),
                child: SizedBox.expand(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [const Text("Language Style"), DropDownLanguage()],
            ),
            const Divider(),
            //Sprache
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [const Text("Language"), Languages()],
            ),
            const Divider(),
            //Temperatureinheit:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [const Text("Unit"), UnitSystems()],
            ),
            const Divider(),
          ],
        )),
      ),
      //Menu Sidebar
      drawer: createSidebar(context),
    );
