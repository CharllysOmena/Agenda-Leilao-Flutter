import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../data/models/usuario.dart';
import '../states/auth_cadastro_state.dart';

part 'cadastro_store.g.dart';

class CadastroStore = _CadastroStoreBase with _$CadastroStore;

abstract class _CadastroStoreBase with Store {
  @observable
  AuthCadastroState state = const StartAuthCadastroState();

  final formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController celularController = TextEditingController();
  TextEditingController senhaConfirmaController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  Usuario? usuario;

  @action
  Future register() async {}

  Usuario montarDados(String email, String senha) =>
      usuario = Usuario(email: email, senha: senha);
}
