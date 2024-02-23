class Usuario {
  String nome;
  String email;
  String senha;
  String contato;

  Usuario({
    required this.nome,
    required this.email,
    required this.senha,
    required this.contato,
  });

  Map<String, dynamic> toJsonLogin() {
    return {
      'username': email,
      'password': senha,
    };
  }
}
