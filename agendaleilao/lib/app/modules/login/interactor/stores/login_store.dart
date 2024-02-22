import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../states/auth_login_state.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @observable
  AuthLoginState state = const StartAuthLoginState();

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  @action
  Future signIn(String email, String senha) async {}
}
