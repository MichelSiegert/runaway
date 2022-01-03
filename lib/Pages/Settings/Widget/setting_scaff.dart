import 'package:away/Pages/Settings/Widget/settingsDropDownWidgets/language.dart';
import 'package:away/Pages/Settings/Widget/settingsDropDownWidgets/language_display.dart';
import 'package:away/Pages/Settings/Widget/settingsDropDownWidgets/unit_system.dart';
import 'package:away/Widgets/sidebar/sidebar.dart';
import 'package:flutter/material.dart';

import 'login_line.dart';

class SettingScaffold extends StatelessWidget {
  final List<String> settings;

  const SettingScaffold({Key? key, required this.settings}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Runaway"),
          backgroundColor: Colors.blueGrey[900],
        ),
        //Text in the middle of the page
        body: Container(
          padding: const EdgeInsets.all(16),
          child: SizedBox.expand(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              LoginLine(
                  dropdown: DropDownLanguage(settings[1]),
                  text: "Language Style"),
              const Divider(),
              //Sprache
              LoginLine(dropdown: Languages(settings[0]), text: "Language"),
              const Divider(),
              //Temperatureinheit:
              LoginLine(dropdown: UnitSystems(settings[2]), text: "Unit"),
              const Divider(),
            ],
          )),
        ),
        //Menu Sidebar
        drawer: const Sidebar(),
      );
}
