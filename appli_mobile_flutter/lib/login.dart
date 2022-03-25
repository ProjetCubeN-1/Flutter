import 'package:appli_mobile_flutter/home_page.dart';
import 'package:appli_mobile_flutter/home_page_connecte.dart';
import 'package:appli_mobile_flutter/login.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

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
  TextEditingController emailController = TextEditingController();
  TextEditingController mdpController = TextEditingController();

  Future userLogin() async {
    // Getting value from Controller
    String email = emailController.text;
    String mdp = mdpController.text;

    // SERVER LOGIN API URL
    var url = 'https://localhost:8080/login/auth';

    // Store all data with Param Name.
    var data = {'email': email, 'password': mdp};

    // Starting Web API Call.
    var response = await http.post(Uri.parse(url), body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);
  }

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
                                  const Text(
                                    'Authentification',
                                    style: TextStyle(
                                        fontSize: 25,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                  ),
                                  TextFormField(
                                    controller: emailController,
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
                                  ),
                                  TextFormField(
                                    controller: mdpController,
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
                                    obscureText: true,
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
                                  userLogin();
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
