import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../interactor/stores/login_store.dart';

class Login extends StatefulWidget {
  const Login({super.key, required this.store});
  final LoginStore store;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/background.jpg',
          fit: BoxFit.cover,
        ),
        Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Image.asset(
                    'assets/logo.png',
                    scale: 4,
                  ),
                  SizedBox(height: 30),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Entrar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Informe os dados para acessar",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w200),
                    ),
                  ),
                  SizedBox(height: 30),
                  Form(
                    key: widget.store.formKey,
                    child: Column(
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
                          controller: widget.store.emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "email@example.com",
                            filled: true,
                            fillColor: Colors.grey[300],
                          ),
                        ),
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Senha",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (senha) =>
                              senha != null && senha.length < 6
                                  ? 'Mínimo de 6 caracteres'
                                  : null,
                          controller: widget.store.senhaController,
                          obscureText: true,
                          obscuringCharacter: '*',
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            hintText: "*********",
                            filled: true,
                            fillColor: Colors.grey[300],
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () =>
                                  Modular.to.pushNamed("/login/esqueci_senha"),
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 13,
                                  ),
                                  text: 'Esqueceu sua senha?',
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            if (widget.store.formKey.currentState!.validate()) {
                              widget.store.signIn(
                                  widget.store.emailController.text.toString(),
                                  widget.store.senhaController.text.toString());
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                            backgroundColor: const Color(0xFFAE841A),
                            textStyle: const TextStyle(
                              fontSize: 23,
                            ),
                          ),
                          child: const Text('Entrar'),
                        ),
                        const SizedBox(height: 25),
                        OutlinedButton(
                          onPressed: () =>
                              Modular.to.pushNamed("/login/cadastro"),
                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                            side: BorderSide(
                              color: Colors.white,
                              width: 3,
                            ),
                          ),
                          child: Text(
                            'Criar conta',
                            style: TextStyle(
                              fontSize: 23,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Image.asset(
                    'assets/logo-dix.png',
                    scale: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
