import 'package:away/Logic/Database/settings.dart';
import 'package:flutter/material.dart';

class DropDownLanguage extends StatefulWidget {
  String dropdownValue;

  DropDownLanguage(this.dropdownValue, {Key? key}) : super(key: key);

  @override
  DropDownLanguageState createState() => DropDownLanguageState();
}

class DropDownLanguageState extends State<DropDownLanguage> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget.dropdownValue,
      items: {"Latin":"lat",
        "binary":"bin",
        "morsecode":"mor"}

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
        setSettings("typo", newVal!);
        setState(() {
          widget.dropdownValue = newVal;

        });
      },
    );
  }
}