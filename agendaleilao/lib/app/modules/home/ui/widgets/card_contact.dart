import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../interactor/stores/detalhes_leilao_store.dart';

class CardContact extends StatelessWidget {
  const CardContact({
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
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.phone, color: Colors.green),
                  SizedBox(width: 5),
                  Text(
                    "${store.leilao!.phone!}",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              OutlinedButton(
                onPressed: () => Modular.to.pushNamed(""),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: Color(0xFFAE841A),
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Compartilhar',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFAE841A),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
