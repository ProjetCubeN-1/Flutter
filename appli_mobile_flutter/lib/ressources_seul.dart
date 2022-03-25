import 'package:appli_mobile_flutter/favoris.dart';
import 'package:appli_mobile_flutter/home_page.dart';
import 'package:appli_mobile_flutter/inscription.dart';
import 'package:appli_mobile_flutter/profile.dart';
import 'package:flutter/material.dart';

class Ressource extends StatefulWidget {
  const Ressource({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Ressource> createState() => _Ressource();
}

class _Ressource extends State<Ressource> {
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
                    builder: (context) => const Ressource(
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
                    child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyHomePage(
                                    title: 'home page',
                                  )),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.arrow_back),
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
                            style: TextStyle(fontSize: 35),
                          ),
                          Text('Monde professionnel',
                              style: TextStyle(fontSize: 25)),
                          Text('Article', style: TextStyle(fontSize: 20)),
                          Text(
                              'Dans cet article, nous souhaitons apporter des éléments de réponse à la question du rire dans les situations professionnelles. Notre objectif est d’orienter les travaux de recherche portant plus globalement sur l’éthique au travail, mais aussi de fournir des repères pour le développement des pratiques de management. Si le rire comme expression émotionnelle spontanée de joie semble de prime abord échapper à toute tentative de management, c’est justement cette attribution communément positive et, de plus, associée à une liberté inaliénable du sujet qui ressort de notre étude comme contribuant en partie aux problèmes qu’il soulève. En effet, le rire désigne un comportement individuelou collectif qui n’émerge et ne trouve son sens que dans un contexte d’échanges sociaux. Située dans le champ de la gestion des ressources humaines, cette étude se limite aux situations professionnelles d’interactions directes entre des personnes au travail. La complexité de la problématique du rire s’en trouve réduite puisque nous écartons les phénomènes de foule, les tabous sociétaux, le rapport au sacré ou encore l’exercice des contre-pouvoirs dans nos démocraties modernes.2Le point de départ des travaux présentés est le constat dans le cadre d’une recherche plus large menée par recherche-action sur le rôle du tiers avec la posture de coach, que plusieurs salariés, demandeurs d’une aide ponctuelle pour résoudre un problème ou sortir d’une situation qu’ils ressentaient comme insupportable, évoquaient “le rire”, celui des autres ou le leur propre, soit comme une source de mal-être, soit comme un mode de résistance ou de défense de soi. Nous nous sommes alors appuyés sur sept cas sélectionnés car ils s’avéraient en rapport direct avec le sujet et l’analyse de contenu des 42 entretiens individuels ainsi réalisés pour proposer une grille d’intelligibilité du phénomène plaçant le rireau travail au cœur d’une problématique managériale d’ordre éthique.3Pour cela, nous avons dans un premier temps effectué une revue de littérature en l’élargissant à la philosophie morale, pour dans une seconde partie procéder à l’analyse de nos matériaux recueillis empiriquement. Nous avions en effet à traiter du rire d’une part en ce qu’il émerge au sein d’une situation professionnelle qu’il transforme, et de l’éthique abordée comme un processus de questionnement de la morale (Ricœur, 2010). Ces deux notions semblaient relever d’obligations s’imposant au sujet pour des raisons obscures et “au-delà” de lui de par sa nature humaine ou d’un impératif supérieur. La question centralede notre étude est ainsi: le rire au travail est-il mal? Et si oui, comment le réguler? D’emblée, nous pouvons préciser que le rire ne peut être considérécomme mal en soi et que par suite, notre questionnement doit trouver une formulation plus appropriée. C’est déjà rentrer dans cette réflexion éthique chère aux philosophes et à laquelle ne peut échapper ni le chercheur en gestion soucieux d’apporter des réponses à la question du bon ou du mal-rire au travail, ni le manager incapable de savoir quand etcomment le réguler. Ainsi, les demandeurs d’aide de l’étude, tous cadres d’entreprise et tous, pour des raisons différentes, subissant concrètement une situation, où deux obligations, celle du rire et celle de la morale, se trouvaient en opposition, faisaient appel à un tiers pour en sortir.4Comment dès lors identifier et traiter de ce qui rentre en tension pour les individus ou les collectifs et qui semble relever moins d’un jugement que du sentiment moral? S’agit-il, pour reprendre une grille d’analyse tirée de la psychologie sociale (Moscovici, 1984, p.9), d’un conflit dans le rapport à un objet, pour nous le travail, entre un sujet individuel en quête d’authenticité et d’affirmation, et un sujet social en quête de conformité et d’intégration? Le rire se situant dans le champ des expressions spontanées d’un ressenti, peut-on solliciter la notion de “dissonance émotionnelle”, déjà développée en appui sur les travaux de Leon Festinger (1957) dans le domaine du management (Van Hoorebeke, 2003)? L’approfondissement dans cette voie au regard denotre problématique considérerait comme un double postulat initial que premièrement, pour prévenir les éventuelles divergences entre rire et morale, les sujets doivent au préalable accéder à la connaissance de l’un comme de l’autre, et deuxièmement, qu’ils arriveront par suite à un contrôle individuel et social des phénomènes du rire. Ce serait supposer que les définitions préexistent à la manifestation du rire, posées définitivement comme des vérités préalables et confondre “éthique” avec discours normatif et pression de conformité. Or, le propre du rire est qu’il ne s’explique pas: il arrive et surprend le rieur. Or, le propre du mal-rire est que s’il est désigné comme une vérité, c’est dans une approche par la manifestation consistant «à laisser-être ce qui se montre» (Thomasset, 1996, p.253).5Nous souhaitons emprunter ce chemin de questionnement et de réflexion pour poser puis tenter de résoudre la problématique de cette étude. Partant de ce mal-rire présent dans les discours de plainte sur le travail, notre objectif est de nous tourner du côté des pratiques de management au sein des organisations pour identifier en quoi elles en favorisent ou non l’émergence. L’objet de notre étude délimitant par ailleurs le champ de sa problématique est donc le vécu d’un rire désigné comme “mal” par au moins un des acteurs de la situation, soit dans l’instant, soit après-coup. Nous avons ensuite questionné ce mal-rire désigné au regard de la littérature et par la mise en évidence et la discussion de trois puis quatre indicateurs nous concluons sur les pratiques de régulation.'),
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
