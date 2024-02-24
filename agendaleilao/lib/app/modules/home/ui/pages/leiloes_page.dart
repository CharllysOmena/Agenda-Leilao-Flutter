import 'package:agendaleilao/app/modules/home/interactor/states/leiloes_state.dart';
import 'package:agendaleilao/app/modules/home/interactor/stores/leiloes_store.dart';
import 'package:agendaleilao/app/modules/home/ui/widgets/custom_card.dart';
import 'package:agendaleilao/app/modules/login/ui/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class LeiloesPage extends StatefulWidget {
  final int type;
  const LeiloesPage({
    Key? key,
    required this.type,
  }) : super(key: key);
  @override
  LeiloesPageState createState() => LeiloesPageState();
}

class LeiloesPageState extends State<LeiloesPage> {
  LeiloesStore store = Modular.get<LeiloesStore>();

  @override
  void initState() {
    store.getLeiloes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Observer(
        builder: (context) {
          if (store.state is SuccessLeiloesState) {
            return Container(
              padding: const EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: store.leiloes.length,
                itemBuilder: (context, index) {
                  if (store.leiloes[index].type == 3) {
                    return CustomCard(
                      leilao: store.leiloes[index],
                    );
                  }
                },
              ),
            );
          } else if (store.state is LoadingLeiloesState) {
            return Stack(
              children: [Loading()],
            );
          } else {
            return Container(
              child: Column(children: [
                Icon(Icons.error),
                Text("Erro desconhecido"),
              ]),
            );
          }
        },
      ),
    );
  }
}
