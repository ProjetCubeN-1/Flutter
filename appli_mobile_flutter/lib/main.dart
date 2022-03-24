import 'package:appli_mobile_flutter/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ressources Relationnelles',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF03989E),
      ),
      home: const MyHomePage(title: "Connexion"),
    );
  }
}
