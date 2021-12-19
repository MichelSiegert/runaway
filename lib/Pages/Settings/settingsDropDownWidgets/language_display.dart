import 'package:flutter/material.dart';

class DropDownLanguage extends StatefulWidget {
  DropDownLanguage({Key? key}) : super(key: key);
  String dropdownValue = "Latin";

  @override
  DropDownLanguageState createState() => DropDownLanguageState();
}

class DropDownLanguageState extends State<DropDownLanguage> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget.dropdownValue,
      items: <String>["Latin", "binary", "morsecode"]
          .map<DropdownMenuItem<String>>(
              (String entry) => DropdownMenuItem<String>(
                    value: entry,
                    child: Text(entry),
                  ))
          .toList(),
      onChanged: (String? newVal) {
        setState(() {
          //TODO hier muss noch das in die DB gespeichert werden.
          widget.dropdownValue = newVal!;
        });
      },
    );
  }
}
