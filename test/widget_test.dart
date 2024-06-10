// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cis350_travel_app/main.dart';
import 'package:cis350_travel_app/home.dart';

void main() {
  testWidgets('Login page test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that login text is detected when started.
    expect(find.text('Login'), findsWidgets);

    final emailField = find.ancestor(
      of: find.text('Email'),
      matching: find.byType(TextFormField),
    );

    final passwordField = find.ancestor(
      of: find.text('Password'),
      matching: find.byType(TextFormField),
    );

    await tester.enterText(emailField, 'NolanSmith@example.com');
    await tester.enterText(passwordField, 'nolansmith123');
    expect(find.text('NolanSmith@example.com'), findsOneWidget);
    expect(find.text('nolansmith123'), findsOneWidget);
    //await tester.tap(find.byType(MaterialButton));

    //await tester.pump();
  });

  testWidgets('Home page test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const Home());

    expect(find.text('Travel App'), findsOneWidget);
  });
}
