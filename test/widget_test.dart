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
import 'package:cis350_travel_app/signup.dart';

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
  });

  testWidgets('Home page test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const Home());

    expect(find.text('Travel Wiki'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.menu));

    await tester.pump();  //use pumpAndSettle if not working

    expect(find.text('Saved Locations'), findsOneWidget);
  });

  testWidgets('Signup page test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const Signup());

    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Re-enter Password'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.arrow_back));

    await tester.pumpAndSettle();

    expect(find.text('Login'), findsWidgets);
  });

  testWidgets('Account settings page test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const Home());

    await tester.tap(find.byIcon(Icons.menu));

    await tester.pumpAndSettle();  //use pumpAndSettle if not working

    expect(find.text('Account Settings'), findsOneWidget);
    final accountSettingsButton = find.text('Account Settings');
    await tester.tap(accountSettingsButton);

    await tester.pumpAndSettle();

    expect(find.text('User Information'), findsOneWidget);
  });
}
