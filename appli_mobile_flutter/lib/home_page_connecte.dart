import 'package:appli_mobile_flutter/favoris.dart';
import 'package:appli_mobile_flutter/home_page.dart';
import 'package:appli_mobile_flutter/inscription.dart';
import 'package:appli_mobile_flutter/profile.dart';
import 'package:flutter/material.dart';

class MyHomePageConnect extends StatefulWidget {
  const MyHomePageConnect({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePageConnect> createState() => _MyHomePageConnect();
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
                    builder: (context) => const Profile(
                          title: 'Profile',
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
                  child: Container(
                    color: Colors.white,
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
