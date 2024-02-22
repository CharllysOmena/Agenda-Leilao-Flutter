import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../interactor/stores/login_store.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({
    super.key,
    required this.store,
  });

  final LoginStore store;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Padding(
        padding: const EdgeInsets.only(top: 230.0),
        child: Form(
          key: store.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Email",
                style: TextStyle(color: Colors.black),
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? 'Digite um email valido'
                        : null,
                controller: store.emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'E-MAIL',
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (senha) => senha != null && senha.length < 6
                    ? 'Minimo de 6 caracteres'
                    : null,
                controller: store.senhaController,
                obscureText: true,
                obscuringCharacter: "*",
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  labelText: 'SENHA',
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Modular.to.navigate("/login");
                    store.emailController.text = "";
                    store.senhaController.text = "";
                  },
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 15),
                      text: "Ja possui conta? ",
                      children: [
                        TextSpan(
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.amber,
                          ),
                          text: "Entrar",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => store.signIn(
                    store.emailController.text, store.senhaController.text),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                  backgroundColor: Colors.amber,
                  textStyle: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                child: const Text("Entrar"),
              ),
              ElevatedButton(
                onPressed: () => store.signIn(
                    store.emailController.text, store.senhaController.text),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                  backgroundColor: Colors.amber,
                  textStyle: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                child: const Text("Entrar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
