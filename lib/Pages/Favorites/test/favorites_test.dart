import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../favorites_page.dart';


void main() {
  testWidgets('Test der favorites page', (WidgetTester tester) async {
    await  tester.pumpWidget(const MaterialApp(
    home: FavoritesPage(title: "Runaway"),
    ),
    );
    final findTitle = find.text("Runaway");
    final findNumber= find.text("Werbung ende");
    expect (findTitle, findsOneWidget);
    expect (findNumber, findsNothing);
  });
}