import 'package:flutter/material.dart';

import '../../interactor/stores/detalhes_leilao_store.dart';

class CardLocation extends StatelessWidget {
  const CardLocation({
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on, color: Colors.green),
                  SizedBox(width: 5),
                  Text(
                    "${store.leilao!.city!}",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
