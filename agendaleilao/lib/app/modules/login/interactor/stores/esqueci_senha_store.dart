import 'package:agendaleilao/app/modules/login/data/repositories/esqueci_senha_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';

import '../states/esqueci_senha_state.dart';

part 'esqueci_senha_store.g.dart';

class EsqueciSenhaStore = _EsqueciSenhaStoreBase with _$EsqueciSenhaStore;

abstract class _EsqueciSenhaStoreBase with Store {
  final IEsqueciSenhaRepository esqueciSenhaRepository;

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  _EsqueciSenhaStoreBase({required this.esqueciSenhaRepository});

  @observable
  EsqueciSenhaState state = StartEsqueciSenhaState();

  Future recuperarSenha(String email) async {
    state = LoadingEsqueciSenhaState();
    EsqueciSenhaState response =
        await esqueciSenhaRepository.recuperarSenha(emailController.text);
    if (response is SuccessEsqueciSenhaState) {
      state = response;
      Fluttertoast.showToast(
        msg: "Senha enviada para email!",
        backgroundColor: Color(0xFFAE841A),
        textColor: Colors.black,
      );
      Modular.to.pop();
    } else {
      Fluttertoast.showToast(
        msg: "Não foi possivel completar a recuperação!",
        backgroundColor: Color(0xFFAE841A),
        textColor: Colors.black,
      );
      Modular.to.pop();
    }
  }
}
