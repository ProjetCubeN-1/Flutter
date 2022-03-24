import 'package:appli_mobile_flutter/home_page.dart';
import 'package:appli_mobile_flutter/home_page_connecte.dart';
import 'package:appli_mobile_flutter/login.dart';
import 'package:flutter/material.dart';

import 'inscription.dart';
import 'main.dart';

void main() {
  runApp(const MyApp());
}

class Login extends StatefulWidget {
  const Login({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              color: const Color.fromARGB(255, 3, 152, 158),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const MyHomePage(
                                                  title: 'HomePage',
                                                )),
                                      );
                                    }, // Image tapped
                                    child: Image.asset(
                                      'assets/images/Logo_appli.png',
                                      fit: BoxFit.cover, // Fixes border issues
                                      width: 250.0,
                                      height: 250.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 500,
                              height: 350,
                              margin: const EdgeInsets.all(7),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextFormField(
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 3, color: Colors.white),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 3, color: Colors.white),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      labelText: 'E-mail',
                                    ),
                                    onSaved: (String? value) {},
                                    validator: (String? value) {
                                      return (value != null &&
                                              value.contains('@'))
                                          ? null
                                          : 'Une adresse mail contient @';
                                    },
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 3, color: Colors.white),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 3, color: Colors.white),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      labelText: 'Mot de Passe',
                                    ),
                                    onSaved: (String? value) {},
                                    validator: (String? value) {
                                      return (value != null &&
                                              value.contains('@'))
                                          ? null
                                          : 'Une adresse mail contient @';
                                    },
                                  ),
                                ],
                              ),
                            )
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
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
                                  "Créer un compte",
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.black),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white)),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MyHomePageConnect(
                                              title: 'Home Page connecté',
                                            )),
                                  );
                                },
                                child: const Text(
                                  "Connexion",
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.black),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white)),
                          ])
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
