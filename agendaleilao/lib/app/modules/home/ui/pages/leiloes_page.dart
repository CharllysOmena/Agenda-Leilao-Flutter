import 'package:agendaleilao/app/modules/home/interactor/states/leiloes_state.dart';
import 'package:agendaleilao/app/modules/home/interactor/stores/leiloes_store.dart';
import 'package:agendaleilao/app/modules/home/ui/widgets/custom_card.dart';
import 'package:agendaleilao/app/modules/login/ui/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
    super.initState();
    store.getLeiloes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (context) {
          if (store.state is SuccessLeiloesState) {
            return Container(
              padding: const EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: store.leiloes.length,
                itemBuilder: (context, index) {
                  if (store.leiloes[index].type == widget.type) {
                    return GestureDetector(
                      onTap: () => Modular.to.pushNamed("/home/detalhes_leilao",
                          arguments: store.leiloes[index]),
                      child: CustomCard(
                        leilao: store.leiloes[index],
                      ),
                    );
                  }
                },
              ),
            );
          } else if (store.state is LoadingLeiloesState) {
            return const Stack(
              children: [Loading()],
            );
          } else {
            return const Center(
              child: Column(
                children: [
                  Icon(
                    Icons.error,
                    size: 30,
                    color: Colors.red,
                  ),
                  Text("Erro desconhecido"),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
