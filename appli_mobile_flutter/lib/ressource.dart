class Ressource {
  final int id;
  final String nom;
  final String contenu;

  const Ressource({required this.id,required this.nom,required this.contenu});

  factory Ressource.fromJson(Map<String, dynamic> json) {
    return Ressource(
      id: json['id_ressource'] as int,
      nom: json['nom_ressources'] as String,
      contenu: json['contenu'] as String,
    );
  }
}