import 'package:agendaleilao/app/modules/home/ui/pages/leiloes_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../interactor/stores/home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => store.logOut(),
            icon: const Icon(Icons.arrow_back),
          )
        ],
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
        title: Observer(builder: (context) {
          return Text(store.titulos[store.indice]);
        }),
      ),
      body: Observer(builder: (context) {
        return LeiloesPage(type: store.indice);
      }),
      bottomNavigationBar: Observer(
        builder: (context) {
          return BottomNavigationBar(
            unselectedFontSize: 15,
            iconSize: 40,
            currentIndex: store.indice,
            onTap: (indice) => store.trocarIndice(indice),
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            fixedColor: Color(0xFFAE841A),
            unselectedItemColor: Colors.white,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.gavel_sharp,
                ),
                label: "Leilões Ao-vivo",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.lock_clock,
                ),
                label: "Leilões agendados",
              ),
            ],
          );
        },
      ),
    );
  }
}
