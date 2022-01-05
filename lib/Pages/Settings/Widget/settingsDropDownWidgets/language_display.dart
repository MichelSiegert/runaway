import 'package:away/Logic/Database/settings.dart';
import 'package:flutter/material.dart';

class DropDownLanguage extends StatefulWidget {
  final String dropdownValue;

  DropDownLanguage(this.dropdownValue, {Key? key}) : super(key: key);

  @override
  DropDownLanguageState createState() => DropDownLanguageState();
}

class DropDownLanguageState extends State<DropDownLanguage> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    dropdownValue ??= widget.dropdownValue;
    return DropdownButton<String>(
      value: dropdownValue,
      items: {"Latin": "lat", "binary": "bin", "morsecode": "mor"}
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
          dropdownValue = newVal;
        });
      },
    );
  }
}
