import 'package:away/Logic/Database/settings.dart';
import 'package:away/Logic/Database/weather.dart';
import 'package:away/Logic/screen_size_calculator.dart';
import 'package:away/Pages/Settings/settingsDropDownWidgets/unit_system.dart';
import 'package:away/Widgets/sidebar.dart';

import 'settingsDropDownWidgets/language.dart';
import 'settingsDropDownWidgets/language_display.dart';
import 'package:flutter/material.dart';

//

Widget buildSettings() => FutureBuilder(
      future: prepareLoadscreen(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          String inputs = snapshot.data as String;
          var seperated = inputs.split(";");
          return settingScaffold("Runaway", context, seperated);
        } else {
          return Scaffold(
              appBar: AppBar(
                title: const Text("Runaway"),
              ),
              body: const Center(child: CircularProgressIndicator()));
        }
      },
    );

Scaffold settingScaffold(
        final String title, BuildContext context, List<String> seperated) =>
    Scaffold(
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
            SizedBox(
              width: calculateWidth(1, context),
              height: calculateHeight(0.1, context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text("Language Style"),
                  DropDownLanguage(seperated[1])
                ],
              ),
            ),
            const Divider(),
            //Sprache
            SizedBox(
                width: calculateWidth(1, context),
                height: calculateHeight(0.1, context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [const Text("Language"), Languages(seperated[0])],
                )),
            const Divider(),
            //Temperatureinheit:
            SizedBox(
                width: calculateWidth(1, context),
                height: calculateHeight(0.1, context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [const Text("Unit"), UnitSystems(seperated[2])],
                )),
            const Divider(),
          ],
        )),
      ),
      //Menu Sidebar
      drawer: createSidebar(context),
    );

// not beautiful but it works.
Future prepareLoadscreen() async {
  String output = "";
  output = await getSettings("lang");
  output += ";";
  output += await getSettings("typo");
  output += ";";
  output += await getSettings("unit");
  return output;
}
