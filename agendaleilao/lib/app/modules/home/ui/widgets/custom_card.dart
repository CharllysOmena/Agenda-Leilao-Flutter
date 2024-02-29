import 'package:agendaleilao/app/modules/home/data/models/leilao.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Leilao leilao;
  const CustomCard({super.key, required this.leilao});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                    'https://nafortuna.com.br/wp-content/uploads/2022/01/arroba-768x576.jpg',
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height / 5,
                    width: 150,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    leilao.name!.toUpperCase(),
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.lock_clock,
                        size: 18,
                      ),
                      Text(
                        leilao.date!,
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Clique e assista esse leilão agora!",
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.fromHeight(50),
                        backgroundColor: Colors.red[900],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Assistir',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
