import 'package:appli_mobile_flutter/home_page.dart';
import 'package:appli_mobile_flutter/home_page_connecte.dart';
import 'package:appli_mobile_flutter/main.dart';
import 'package:appli_mobile_flutter/validator.dart';
import 'package:crypt/crypt.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'inscription.dart';

void main() {
  runApp(const MyApp());
}

class Login2 extends StatefulWidget {
  const Login2({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Login2> createState() => _Login2();
}

class _Login2 extends State<Login2> {
  TextEditingController emailController = TextEditingController();
  TextEditingController mdpController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future userLogin() async {
    // Getting value from Controller
    String email = emailController.text;
    String mdp = Crypt.sha256(mdpController.text).toString();

    // SERVER LOGIN API URL
    var url = 'https://cube.bookingcal.cloud/api/connexion';

    // Store all data with Param Name.
    var data = {'email': email, 'password': mdp};

    // Starting Web API Call.
    var response = await http.post(Uri.parse(url), body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);
    if (message == "Authentification reussi") {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const MyHomePageConnect(
                  title: 'Home Page connecté',
                )),
      );
    } else {
      return "erreur";
    }
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
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Image.asset(
                                              'assets/images/Logo_appli.png',
                                              fit: BoxFit
                                                  .cover, // Fixes border issues
                                              width: 250.0,
                                              height: 250.0,
                                            ),
                                            const Text(
                                              'Authentification',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255)),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                              Container(
                                width: 500,
                                height: 350,
                                margin: const EdgeInsets.all(7),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextFormField(
                                        controller: emailController,
                                        validator: validator([
                                          checkNotEmpty(
                                              error: "Entrer un email svp"),
                                          checkEmailFormat(
                                              error:
                                                  "Format de l'email invalide")
                                        ]),
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                width: 3, color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                width: 3, color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          labelText: 'E-mail',
                                        ),
                                        onSaved: (String? value) {},
                                      ),
                                      TextFormField(
                                        controller: mdpController,
                                        validator: validator([
                                          checkLength(min: 8, max: 15, error: "Doit contenir entre 8 et 15 caractères"),
                                          checkPassword(
                                              error:
                                                  "Le mot de passe doit contenir au moins un chiffre, \nune lettre minuscule, une lettre majuscule et un caractère spécial")
                                        ]),
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                width: 3, color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                width: 3, color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          labelText: 'Mot de Passe',
                                        ),
                                        onSaved: (String? value) {},
                                        obscureText: true,
                                      ),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            ElevatedButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const Inscription2(
                                                              title:
                                                                  'Inscription',
                                                            )),
                                                  );
                                                },
                                                child: const Text(
                                                  "Créer un compte",
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      color: Colors.black),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.white)),
                                            ElevatedButton(
                                              onPressed: () {
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  // If the form is valid, display a snackbar. In the real world,
                                                  // you'd often call a server or save the information in a database.
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    const SnackBar(
                                                        content: Text(
                                                            'Processing Data')),
                                                  );
                                                  userLogin();
                                                }
                                              },
                                              child: const Text(
                                                "Connexion",
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ]),
                                    ],
                                  ),
                                ),
                              )
                            ]),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
