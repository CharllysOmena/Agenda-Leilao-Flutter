import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../interactor/states/auth_login_state.dart';
import '../../interactor/stores/login_store.dart';
import '../widgets/loading.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = 'LoginPage'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  LoginStore store = Modular.get<LoginStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (context) {
          return (store.state is LoadingAuthLoginState)
              ? const Loading()
              : Stack(
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
                            SizedBox(height: 55),
                            Image.asset(
                              'assets/logo.png',
                              scale: 4,
                            ),
                            SizedBox(height: 40),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Entrar",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Informe os dados para acessar",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w200),
                              ),
                            ),
                            SizedBox(height: 30),
                            Form(
                              key: store.formKey,
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Email",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (email) => email != null &&
                                            !EmailValidator.validate(email)
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
                                  SizedBox(height: 20),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Senha",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (senha) =>
                                        senha != null && senha.length < 6
                                            ? 'Mínimo de 6 caracteres'
                                            : null,
                                    controller: store.senhaController,
                                    obscureText: true,
                                    obscuringCharacter: '*',
                                    keyboardType: TextInputType.visiblePassword,
                                    decoration: InputDecoration(
                                      hintText: "*********",
                                      filled: true,
                                      fillColor: Colors.white,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: RichText(
                                          text: TextSpan(
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 15,
                                            ),
                                            text: 'Esqueceu sua senha?',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size.fromHeight(60),
                                      backgroundColor: Color(0xFFAE841A),
                                      textStyle: const TextStyle(
                                        fontSize: 23,
                                      ),
                                    ),
                                    child: const Text('Entrar'),
                                  ),
                                  SizedBox(height: 25),
                                  OutlinedButton(
                                    onPressed: () =>
                                        Modular.to.pushNamed("/cadastro"),
                                    style: OutlinedButton.styleFrom(
                                      minimumSize: Size.fromHeight(60),
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
                            SizedBox(height: 70),
                            Image.asset(
                              'assets/logo-dix.png',
                              scale: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
