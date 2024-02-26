import 'package:agendaleilao/app/modules/login/data/models/usuario.dart';
import 'package:agendaleilao/app/modules/login/data/services/auth_login_service.dart';
import 'package:agendaleilao/app/modules/login/data/services/token_auth_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';
import '../states/auth_login_state.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final IAuthLoginService authLoginService;
  TokenAuthCache tokenAuthCache = TokenAuthCache.instance;

  @observable
  AuthLoginState state = const StartAuthLoginState();

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  _LoginStoreBase({required this.authLoginService});

  @action
  Future signIn(String email, String senha) async {
    state = const LoadingAuthLoginState();
    AuthLoginState response =
        await authLoginService.signIn(montarDados(email, senha));

    if (response is SuccessAuthLoginState) {
      state = response;
      await tokenAuthCache.saveToken(response.token);
      Modular.to.navigate("/home");
    } else {
      state = response;
      if (await tokenAuthCache.hasToken() == true) {
        tokenAuthCache.deleteToken();
      }
      Fluttertoast.showToast(
        msg: "E-mail ou senha incorreta!",
        backgroundColor: Color(0xFFAE841A),
        textColor: Colors.black,
      );
    }
  }

  Usuario montarDados(String email, String senha) =>
      Usuario(nome: "", email: email, senha: senha, contato: "");
}
