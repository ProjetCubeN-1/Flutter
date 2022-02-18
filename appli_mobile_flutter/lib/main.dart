import 'package:appli_mobile_flutter/inscription.dart';
import 'package:appli_mobile_flutter/login.dart';
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
      home: const Login(title: "Connexion"),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              color: const Color.fromARGB(255, 3, 152, 158),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/Logo_appli.png",
                    width: 250,
                    height: 250,
                  ),
                ],
              ),
            ),
            Column(
              children: const [
                Text(
                  'Bienvenue sur le réseau (Re)sources Relationnelles',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                Text(
                  'Pour commencer vous devez vous créer un compte !',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Inscription(
                                title: 'Inscription',
                              )),
                    );
                  },
                  child: const Text(
                    "Inscription",
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.white)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Login(
                                title: 'Authentification',
                              )),
                    );
                  },
                  child: const Text(
                    "Authentification",
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.white)),
            ])
          ],
        ),
      ),
    );
  }
}
