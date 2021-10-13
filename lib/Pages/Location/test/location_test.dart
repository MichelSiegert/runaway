import 'package:away/Pages/Location/locations_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Test der Locationspage', (WidgetTester tester) async {
    await  tester.pumpWidget(const MaterialApp(
    home: LocationsPage(title: "Runaway"),
    ),
    );
    final findTitle = find.text("Runaway");
    final findNumber= find.text("Werbung ende");
    expect (findTitle, findsOneWidget);
    expect (findNumber, findsNothing);
  });
}