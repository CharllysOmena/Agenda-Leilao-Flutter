import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashscreenPage extends StatefulWidget {
  final String title;
  const SplashscreenPage({Key? key, this.title = 'SplashscreenPage'})
      : super(key: key);
  @override
  SplashscreenPageState createState() => SplashscreenPageState();
}

class SplashscreenPageState extends State<SplashscreenPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () => Modular.to.navigate("/home"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          "assets/background_splash.png",
          fit: BoxFit.cover,
          height: double.infinity,
        ),
        Padding(
          padding: const EdgeInsets.all(72.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 250,
              ),
              Image.asset(
                "assets/logo_completa.png",
                scale: 4,
              ),
              SizedBox(height: 150),
              Text(
                "Leilões online para rematar seu gado com praticidade.",
                style: TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40,
              ),
              CircularProgressIndicator(
                color: Colors.white,
              )
            ],
          ),
        ),
      ],
    ));
  }
}
