import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agenda de leilões',
      theme: ThemeData(scaffoldBackgroundColor: Colors.grey[900]),
      debugShowCheckedModeBanner: false,
    ).modular();
  }
}
