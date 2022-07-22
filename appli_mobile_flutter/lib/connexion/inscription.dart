import 'dart:convert';

import 'package:appli_mobile_flutter/home_page.dart';
import 'package:appli_mobile_flutter/home_page_connecte.dart';
import 'package:appli_mobile_flutter/login.dart';
import 'package:appli_mobile_flutter/validator.dart';
import 'package:crypt/crypt.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Inscription2 extends StatefulWidget {
  const Inscription2({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Inscription2> createState() => _Inscription2();
}

class _Inscription2 extends State<Inscription2> {
  TextEditingController prenom = TextEditingController();
  TextEditingController nom = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mdp = TextEditingController();
  TextEditingController dateNaissance = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Future<List?> senddata() async {
    Map json = {
      "prenom": prenom.text,
      "email": email.text,
      "nom": nom.text,
      "pass": Crypt.sha256(mdp.text).toString(),
      "date_naissance": dateNaissance.text
    };
    //encode a json string
    var jsonEncodee = jsonEncode(json);
    await http.post(Uri.parse('https://cube.bookingcal.cloud/api/inscription'),
        body: jsonEncodee, headers: {"Content-Type": "application/json"});
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
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
                                          MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          'assets/images/Logo_appli.png',
                                          fit: BoxFit
                                              .cover, // Fixes border issues
                                          width: 250.0,
                                          height: 250.0,
                                        ),
                                        const Text(
                                          'Inscription',
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255)),
                                        ),
                                      ]),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 500,
                            height: 600,
                            margin: const EdgeInsets.only(top: 20, left: 8, right: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Form(
                                    key: _formKey,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        TextFormField(
                                          controller: nom,
                                          validator: validator([
                                            checkNotEmpty(
                                                error: 'Entrer un nom svp')
                                          ]),
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  width: 3,
                                                  color: Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  width: 3,
                                                  color: Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            labelText: 'Nom',
                                          ),
                                          onSaved: (String? value) {},
                                        ),
                                        TextFormField(
                                          validator: validator([
                                            checkNotEmpty(
                                                error: "Entrer un prénom svp")
                                          ]),
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  width: 3,
                                                  color: Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  width: 3,
                                                  color: Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            labelText: 'Prénom',
                                          ),
                                          onSaved: (String? value) {},
                                          controller: prenom,
                                        ),
                                        TextFormField(
                                          validator: validator([
                                            checkNotEmpty(
                                                error: "Entrer un email svp"),
                                            checkEmailFormat(
                                                error:
                                                    "Format de l'email invalide")
                                          ]),
                                          decoration: InputDecoration(
                                            labelText: 'E-mail',
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  width: 3,
                                                  color: Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  width: 3,
                                                  color: Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                          onSaved: (String? value) {},
                                          controller: email,
                                        ),
                                        TextFormField(
                                          validator: validator([
                                            checkNotEmpty(
                                                error:
                                                    "Entrer une date de naissance svp")
                                          ]),
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  width: 3,
                                                  color: Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  width: 3,
                                                  color: Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            labelText: 'Date de Naissance',
                                          ),
                                          keyboardType: TextInputType.none,
                                          readOnly: true,
                                          onSaved: (String? value) {},
                                          onTap: () {
                                            showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(1900),
                                                    lastDate: DateTime(2050))
                                                .then((date) {
                                              setState(() {
                                                dateNaissance.text = date
                                                    .toString()
                                                    .substring(0, 10);
                                              });
                                            });
                                          },
                                          controller: dateNaissance,
                                        ),
                                        TextFormField(
                                          validator: validator([
                                            checkLength(min: 8, max: 15, error: "Doit contenir entre 8 et 15 caractères"),
                                            checkPassword(
                                                error:
                                                    "Le mot de passe doit contenir au moins un chiffre, une lettre minuscule, une lettre majuscule et un caractère spécial")
                                          ]),
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  width: 3,
                                                  color: Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  width: 3,
                                                  color: Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            labelText: 'Mot de passe',
                                          ),
                                          onSaved: (String? value) {},
                                          controller: mdp,
                                          obscureText: true,
                                        ),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              ElevatedButton(
                                                  onPressed: () {
                                                    if (_formKey.currentState!
                                                        .validate()) {
                                                      // If the form is valid, display a snackbar. In the real world,
                                                      // you'd often call a server or save the information in a database.
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        const SnackBar(
                                                            content: Text(
                                                                'Processing Data')),
                                                      );
                                                      senddata();
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const MyHomePageConnect(
                                                                  title:
                                                                      'Home Page connecté',
                                                                )),
                                                      );
                                                    }
                                                  },
                                                  child: const Text(
                                                    "Créer",
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        color: Colors.black),
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          primary:
                                                              Colors.white)),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const Login(
                                                                title:
                                                                    'Connexion',
                                                              )),
                                                    );
                                                  },
                                                  child: const Text(
                                                    "Déja un compte ?",
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        color: Colors.black),
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          primary:
                                                              Colors.white)),
                                            ])
                                      ],
                                    ))
                              ],
                            ),
                          )
                        ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
