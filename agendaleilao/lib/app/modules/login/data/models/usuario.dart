class Usuario {
  String email;
  String senha;

  Usuario({
    required this.email,
    required this.senha,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'senha': senha,
    };
  }
}
