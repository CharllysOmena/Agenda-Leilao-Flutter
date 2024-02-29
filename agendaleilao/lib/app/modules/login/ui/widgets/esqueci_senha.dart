import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../../interactor/stores/esqueci_senha_store.dart';

class EsqueciSenha extends StatelessWidget {
  const EsqueciSenha({
    super.key,
    required this.store,
  });

  final EsqueciSenhaStore store;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/background.jpg',
          fit: BoxFit.cover,
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Email",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                          ? 'Digite um email válido'
                          : null,
                  controller: store.emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "email@example.com",
                    filled: true,
                    fillColor: Colors.grey[300],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (store.formKey.currentState!.validate()) {
                      // store.recuperarSenha(store.emailController.text);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: const Color(0xFFAE841A),
                    textStyle: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  child: const Text('recuperar senha'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
