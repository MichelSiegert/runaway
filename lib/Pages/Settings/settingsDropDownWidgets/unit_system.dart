import 'package:away/Logic/Database/settings.dart';
import 'package:flutter/material.dart';

class UnitSystems extends StatefulWidget {
  UnitSystems({Key? key}) : super(key: key);
  String dropdownValue = "metric";

  @override
  UnitSystemsState createState() => UnitSystemsState();
}

class UnitSystemsState extends State<UnitSystems> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget.dropdownValue,
      items: {"Celsius": "metric", "Fahrenheit": "imperial"}
          .map((description, value) => MapEntry(
              description,
              DropdownMenuItem<String>(
                value: value,
                child: Text(description),
              )))
          .values
          .toList(),
      onChanged: (String? newVal) {
        setSettings("unit", newVal!);
        setState(() {
          //TODO hier muss noch das in die DB gespeichert werden.
          widget.dropdownValue = newVal;
        });
      },
    );
  }
}
