typedef Validator = String? Function(String?);

class checkLength{
  static String? validate(String value){
    if (value.length > 8 || value.length < 15) {
      return 'Doit contenir entre 8 et 15 caractères';
    }
  }
}

class checkNotEmpty{
  static String? validate(String value){
    return value.isEmpty ? 'Entrer une valeur' : null;
  }
}

class checkEmailFormat{
  static String? validate(String value){
    if (!RegExp(r"[^@]+@[^\.]+\..+").hasMatch(value)) {
      return "Email Invalide";
    }
    return null;
  }
}

class checkPassword{
  static String? validate(String value){
    if (!RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\W).*$").hasMatch(value)) {
      return "Mot de passe invalide";
    }
    return null;
  }
}
