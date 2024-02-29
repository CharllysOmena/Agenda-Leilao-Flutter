import 'package:agendaleilao/app/modules/login/interactor/states/esqueci_senha_state.dart';
import 'package:agendaleilao/app/modules/login/interactor/stores/esqueci_senha_store.dart';
import 'package:agendaleilao/app/modules/login/ui/widgets/loading.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../widgets/esqueci_senha.dart';

class EsqueciSenhaPage extends StatefulWidget {
  final String title;
  const EsqueciSenhaPage({Key? key, this.title = 'Resuperar senha'})
      : super(key: key);
  @override
  EsqueciSenhaPageState createState() => EsqueciSenhaPageState();
}

class EsqueciSenhaPageState extends State<EsqueciSenhaPage> {
  EsqueciSenhaStore store = Modular.get<EsqueciSenhaStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.grey, Colors.black],
                stops: [0.0, 0.9],
              ),
            ),
          ),
          title: Text(widget.title),
        ),
        body: Observer(builder: (context) {
          if (store.state is LoadingEsqueciSenhaState) {
            return Stack(
              children: [EsqueciSenha(store: store), Loading()],
            );
          } else {
            return EsqueciSenha(store: store);
          }
        }));
  }
}
