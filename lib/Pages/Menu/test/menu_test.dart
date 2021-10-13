import 'package:away/Pages/Menu/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(' Test der menu page', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await  tester.pumpWidget(const MaterialApp(
      home: MenuPage(title: "Runaway"),
    ),
    );
    final findTitle = find.text("Runaway");
    final findNumber= find.text("Werbung ende");
    expect (findTitle, findsOneWidget);
    expect (findNumber, findsNothing);
  });
}