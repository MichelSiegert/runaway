import 'package:away/Database/settings.dart';
import 'package:flutter/material.dart';

class Languages extends StatefulWidget {
  Languages({Key? key}) : super(key: key);
  String dropdownValue = "Latinus";

  @override
  LanguagesState createState() => LanguagesState();
}

class LanguagesState extends State<Languages> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget.dropdownValue,
      //TODO this solution has to be better.
      items: <String>[
        "Latinus",
        "Deutsch",
        "English",
        "tlhInganpu\'",
        "Esperanto"
      ]
          .map<DropdownMenuItem<String>>(
              (String entry) => DropdownMenuItem<String>(
                    value: "en",
                    child: Text(entry),
                  ))
          .toList(),
      onChanged: (String? newVal) {
        //TODO setSettings is for db, rename
        setSettings("lang", newVal!);
        setState(() {
          widget.dropdownValue = newVal;
        });
      },
    );
  }
}
