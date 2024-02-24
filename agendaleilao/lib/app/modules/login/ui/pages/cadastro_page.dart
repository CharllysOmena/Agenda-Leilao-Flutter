import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../interactor/states/auth_cadastro_state.dart';
import '../../interactor/stores/cadastro_store.dart';
import '../widgets/cadastro.dart';
import '../widgets/loading.dart';

class CadastroPage extends StatefulWidget {
  final String title;
  const CadastroPage({Key? key, this.title = 'Criar Conta'}) : super(key: key);
  @override
  CadastroPageState createState() => CadastroPageState();
}

class CadastroPageState extends State<CadastroPage> {
  final store = Modular.get<CadastroStore>();

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
      body: Observer(
        builder: (context) {
          return (store.state is LoadingAuthCadastroState)
              ? const Loading()
              : Cadastro(store: store);
        },
      ),
    );
  }
}
