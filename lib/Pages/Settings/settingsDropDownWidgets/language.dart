import 'package:away/Logic/Database/settings.dart';
import 'package:flutter/material.dart';

class Languages extends StatefulWidget {
  Languages(this.dropdownValue, {Key? key}) : super(key: key);
  String dropdownValue;

  @override
  LanguagesState createState() => LanguagesState();
}

class LanguagesState extends State<Languages> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget.dropdownValue,
      //TODO this solution has to be better.
      items: {
        "Latinus": "lt",
        "Deutsch": "de",
        "English": "en",
        "tlhInganpu\'": "kl",
        "Esperanto": "ep"
      }
          .map(
            (description, value) => MapEntry(
              description,
              DropdownMenuItem<String>(
                value: value,
                child: Text(description),
              ),
            ),
          )
          .values
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
