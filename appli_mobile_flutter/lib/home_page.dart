import 'package:appli_mobile_flutter/inscription.dart';
import 'package:appli_mobile_flutter/ressources_seul.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'assets/images/Logo_appli.png',
          fit: BoxFit.cover, // Fixes border issues
          width: 250.0,
          height: 250.0,
        ),
        title: const Text('(RE)SOURCES\nRELATIONELLES'),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const Inscription(
                          title: 'Inscription',
                        )),
              );
            },
            child: const Padding(
                padding: EdgeInsets.all(10), child: Icon(Icons.person)),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyHomePage(
                          title: 'MyHomePage',
                        )),
              );
            },
            child: const Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Icon(Icons.home)),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 3, 152, 158),
      ),
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
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Ressource(
                                    title: 'Ressource',
                                  )),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.blue,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          children: const [
                            Text(
                              'Le rire au travail et l’éthique',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text('Monde professionnel',
                                style: TextStyle(fontSize: 15)),
                            Text('Article', style: TextStyle(fontSize: 13)),
                            Text(
                                'Dans cet article, nous souhaitons apporter des éléments de réponse à la question du rire dans les situations professionnelles. Notre objectif est d’orienter les travaux de recherche portant plus grand....'),
                            Text('Lire la suite...')
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: const [
                          Text(
                            'Le rire au travail et l’éthique',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text('Monde professionnel',
                              style: TextStyle(fontSize: 15)),
                          Text('Article', style: TextStyle(fontSize: 13)),
                          Text(
                              'Dans cet article, nous souhaitons apporter des éléments de réponse à la question du rire dans les situations professionnelles. Notre objectif est d’orienter les travaux de recherche portant plus grand'),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: const [
                          Text(
                            'Le rire au travail et l’éthique',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text('Monde professionnel',
                              style: TextStyle(fontSize: 15)),
                          Text('Article', style: TextStyle(fontSize: 13)),
                          Text(
                              'Dans cet article, nous souhaitons apporter des éléments de réponse à la question du rire dans les situations professionnelles. Notre objectif est d’orienter les travaux de recherche portant plus grand'),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: const [
                          Text(
                            'Le rire au travail et l’éthique',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text('Monde professionnel',
                              style: TextStyle(fontSize: 15)),
                          Text('Article', style: TextStyle(fontSize: 13)),
                          Text(
                              'Dans cet article, nous souhaitons apporter des éléments de réponse à la question du rire dans les situations professionnelles. Notre objectif est d’orienter les travaux de recherche portant plus grand'),
                        ],
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
