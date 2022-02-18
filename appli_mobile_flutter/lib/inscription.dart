import 'package:appli_mobile_flutter/login.dart';
import 'package:flutter/material.dart';

import 'main.dart';

void main() {
  runApp(const MyApp());
}

class Inscription extends StatefulWidget {
  const Inscription({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Inscription> createState() => _Inscription();
}

class _Inscription extends State<Inscription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                        Image.asset(
                          "assets/images/Logo_appli.png",
                          width: 250,
                          height: 250,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 500,
                    height: 350,
                    margin: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                            labelText: 'Nom',
                          ),
                          onSaved: (String? value) {},
                          validator: (String? value) {
                            return (value != null && value.contains('@'))
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
                            labelText: 'Prénom',
                          ),
                          onSaved: (String? value) {},
                          validator: (String? value) {
                            return (value != null && value.contains('@'))
                                ? null
                                : 'Une adresse mail contient @';
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'E-mail',
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
                          ),
                          onSaved: (String? value) {},
                          validator: (String? value) {
                            return (value != null && value.contains('@'))
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
                            labelText: 'Date de Naissance',
                          ),
                          onSaved: (String? value) {},
                          validator: (String? value) {
                            return (value != null && value.contains('@'))
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
                            labelText: 'Mot de passe',
                          ),
                          onSaved: (String? value) {},
                          validator: (String? value) {
                            return (value != null && value.contains('@'))
                                ? null
                                : 'Une adresse mail contient @';
                          },
                        ),
                      ],
                    ),
                  )
                ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "Créer",
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.white)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Login(
                                title: 'Connexion',
                              )),
                    );
                  },
                  child: const Text(
                    "Déja un compte ?",
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
