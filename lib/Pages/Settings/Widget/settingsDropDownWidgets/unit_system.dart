import 'package:away/Logic/Database/settings.dart';
import 'package:flutter/material.dart';

class UnitSystems extends StatefulWidget {
  UnitSystems(this.dropdownValue, {Key? key}) : super(key: key);
  final String dropdownValue;

  @override
  UnitSystemsState createState() => UnitSystemsState();
}

class UnitSystemsState extends State<UnitSystems> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    dropdownValue ??= widget.dropdownValue;
    return DropdownButton<String>(
      value: dropdownValue,
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
          dropdownValue = newVal;
        });
      },
    );
  }
}
