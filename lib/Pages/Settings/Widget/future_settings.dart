import 'package:away/Logic/Database/settings.dart';
import 'package:away/Pages/Settings/Widget/setting_scaff.dart';
import 'package:away/Widgets/load_scaff.dart';
import 'package:flutter/material.dart';

class FutureSettings extends StatelessWidget {
  const FutureSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: prepareLoadscreen(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            String inputs = snapshot.data as String;
            var seperated = inputs.split(";");
            return SettingScaffold(settings:  seperated);
          } else {
            return const LoadingScaffold();
          }
        },
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
}
