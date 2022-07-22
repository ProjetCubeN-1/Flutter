import 'dart:convert';

import 'package:appli_mobile_flutter/favoris.dart';
import 'package:appli_mobile_flutter/home_page.dart';
import 'package:flutter/material.dart';
import 'ressource.dart';
import 'package:http/http.dart' as http;


class MyHomePageConnect extends StatefulWidget {
  const MyHomePageConnect({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePageConnect> createState() => _MyHomePageConnect();
}

Future<List<Ressource>> fetchRessource(http.Client client) async {
  final response =
      await http.get(Uri.parse('https://cube.bookingcal.cloud/api/ressources_mobile'));
  return parseRessource(response.body);
}

List<Ressource> parseRessource(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Ressource>((json) => Ressource.fromJson(json)).toList();
}

class _MyHomePageConnect extends State<MyHomePageConnect> {
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
                    builder: (context) => const MyHomePage(
                          title: 'deconnecte',
                        )),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.power_settings_new),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyHomePageConnect(
                          title: 'MyHomePage',
                        )),
              );
            },
            child: const Padding(
                padding: EdgeInsets.all(10), child: Icon(Icons.home)),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const Favoris(
                          title: 'Favoris',
                        )),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.favorite),
            ),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 3, 152, 158),
      ),
      body: SingleChildScrollView(
        child:Column(
              children: <Widget>[
                Center(
                    child: Column(
                  children: [
                    FutureBuilder<List<Ressource>>(
                      future: fetchRessource(http.Client()),
                      builder: (context, snapshot) {
                        if (snapshot.hasError){
                          return const Center(child: Text('ERREUR'),);
                        } else if (snapshot.hasData){
                          return RessourceList(ressources: snapshot.data!);
                        }
                        else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        }
                      )
                  ],
                )),
              ],
            ),
    ));
  }
}

class RessourceList extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const RessourceList({required this.ressources});
   final List<Ressource> ressources;

  @override
   Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: ressources.length,
      itemBuilder: (context, index) {
        return Center(child: Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.blue,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(child: Column(
            children: [
              Text(
                ressources[index].nom,
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                  ressources[index].contenu,
              ),
            ],
          )),
        ));
      }
    );
   }
}
