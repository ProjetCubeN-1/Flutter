// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:appli_mobile_flutter/home_page.dart';
import 'package:appli_mobile_flutter/inscription.dart';
import 'package:appli_mobile_flutter/login.dart';
import 'package:appli_mobile_flutter/validator2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test validator checkNotEmpty', (WidgetTester tester) async {
    var result = checkNotEmpty.validate("");
    expect(result, 'Entrer une valeur');
  });

  testWidgets('Test validator CheckEmailFormat', (WidgetTester tester) async {
    var result = checkEmailFormat.validate("az");
    expect(result, 'Email Invalide');
  });

  testWidgets('Test validator checkPassword', (WidgetTester tester) async {
    var result = checkPassword.validate("");
    expect(result, 'Mot de passe invalide');
  });

  testWidgets('Test validator checkNotEmpty', (WidgetTester tester) async {
    var result = checkLength.validate("");
    expect(result, 'Doit contenir entre 8 et 15 caractères');
  });

  testWidgets('Inscription', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Inscription(title: 'incsription',)
    ));
    expect(find.byType(TextFormField), findsNWidgets(5));
    expect(find.byType(ElevatedButton), findsNWidgets(2));
  });

  testWidgets('Connexion', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Login(title: 'login',)
    ));
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.byType(ElevatedButton), findsNWidgets(2));
  });

  testWidgets('home_page', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: MyHomePage(title: 'login',)
    ));
    expect(find.byType(Container), findsOneWidget);
  });
}
