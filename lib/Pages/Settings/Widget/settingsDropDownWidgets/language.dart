import 'package:away/Logic/Database/settings.dart';
import 'package:flutter/material.dart';

class Languages extends StatefulWidget {
  const Languages(this.dropdownValue, {Key? key}) : super(key: key);
  final dropdownValue;

  @override
  LanguagesState createState() => LanguagesState();
}

class LanguagesState extends State<Languages> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    dropdownValue ??= widget.dropdownValue;
    return DropdownButton<String>(
      value: dropdownValue,
      items: {
        "Latinus": "lt",
        "Deutsch": "de",
        "English": "en",
        "tlhInganpu'": "kl",
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
        setSettings("lang", newVal!);
        setState(() {
          dropdownValue = newVal;
        });
      },
    );
  }
}
