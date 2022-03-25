import 'package:appli_mobile_flutter/home_page.dart';
import 'package:appli_mobile_flutter/home_page_connecte.dart';
import 'package:appli_mobile_flutter/inscription.dart';
import 'package:flutter/material.dart';

class Favoris extends StatefulWidget {
  const Favoris({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Favoris> createState() => _Favoris();
}

class _Favoris extends State<Favoris> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBar(
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
              child: const Icon(Icons.person)),
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
              child: const Icon(Icons.home)),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Icon(Icons.favorite_border),
          ),
          const Icon(Icons.more_horiz),
        ],
        backgroundColor: const Color.fromARGB(255, 3, 152, 158),
      ),
    );
  }
}
