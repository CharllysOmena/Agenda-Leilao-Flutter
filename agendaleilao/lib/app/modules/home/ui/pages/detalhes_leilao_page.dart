import 'package:agendaleilao/app/modules/home/interactor/stores/detalhes_leilao_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../widgets/card_contact.dart';
import '../widgets/card_image_title.dart';
import '../widgets/card_location.dart';

class DetalhesLeilaoPage extends StatefulWidget {
  final String title;
  const DetalhesLeilaoPage({Key? key, this.title = 'Detalhes do leilão'})
      : super(key: key);
  @override
  DetalhesLeilaoPageState createState() => DetalhesLeilaoPageState();
}

class DetalhesLeilaoPageState extends State<DetalhesLeilaoPage> {
  DetalhesLeilaoStore store = Modular.get<DetalhesLeilaoStore>();

  @override
  void initState() {
    store.recuperarLeilao();
    super.initState();
  }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CardImageTitle(store: store),
              SizedBox(
                height: 20,
              ),
              CardLocation(store: store),
              SizedBox(
                height: 15,
              ),
              CardContact(store: store),
            ],
          ),
        ),
      ),
    );
  }
}
