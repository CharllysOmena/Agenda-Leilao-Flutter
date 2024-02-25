import 'package:flutter/material.dart';

import '../../interactor/stores/detalhes_leilao_store.dart';

class CardImageTitle extends StatelessWidget {
  const CardImageTitle({
    super.key,
    required this.store,
  });

  final DetalhesLeilaoStore store;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              'https://nafortuna.com.br/wp-content/uploads/2022/01/arroba-768x576.jpg',
              fit: BoxFit.cover,
              height: 300,
            ),
            Container(
              color: Color(0xFFAE841A),
              height: 50,
              child: Center(
                child: Text(
                  "${store.leilao!.date!} às ${store.leilao!.time!} ",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              store.leilao!.name!.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
