import 'package:flutter/material.dart';

class UnitSystems extends StatefulWidget {
  UnitSystems({Key? key}) : super(key: key);
  String dropdownValue = "Celsius";

  @override
  UnitSystemsState createState() => UnitSystemsState();
}

class UnitSystemsState extends State<UnitSystems> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget.dropdownValue,
      items: <String>["Celsius", "Fahrenheit", "Kelvin"]
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
