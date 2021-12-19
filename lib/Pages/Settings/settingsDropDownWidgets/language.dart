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
      items: <String>["Latinus","Deutsch", "English", "tlhInganpu\'", "Esperanto"]
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
