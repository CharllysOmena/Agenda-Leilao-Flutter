import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../interactor/stores/cadastro_store.dart';

class FormCadastro extends StatelessWidget {
  const FormCadastro({
    super.key,
    required this.store,
  });

  final CadastroStore store;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Form(
        key: store.formkey,
        child: Column(
          children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (email) =>
                  email != null && !EmailValidator.validate(email)
                      ? 'Digite um email valido'
                      : null,
              controller: store.emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'E-MAIL'),
            ),
            SizedBox(height: 20),
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
                  border: const OutlineInputBorder(), labelText: 'SENHA'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                store.montarDados(
                    store.emailController.text, store.senhaController.text);
                store.register();
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50),
                backgroundColor: Colors.amber,
                textStyle: const TextStyle(
                  fontSize: 20,
                ),
              ),
              child: const Text("Cadastrar"),
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
            )
          ],
        ),
      ),
    );
  }
}
