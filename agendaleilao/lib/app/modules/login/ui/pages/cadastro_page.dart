import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../interactor/states/auth_cadastro_state.dart';
import '../../interactor/stores/cadastro_store.dart';
import '../widgets/loading.dart';

class CadastroPage extends StatefulWidget {
  final String title;
  const CadastroPage({Key? key, this.title = 'CadastroPage'}) : super(key: key);
  @override
  CadastroPageState createState() => CadastroPageState();
}

class CadastroPageState extends State<CadastroPage> {
  final store = Modular.get<CadastroStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.grey, Colors.black],
              stops: [0.0, 0.9],
            ),
          ),
        ),
        title: Text('Home'),
      ),
      body: Observer(
        builder: (context) {
          return (store.state is LoadingAuthCadastroState)
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
                            SizedBox(height: 20),
                            Form(
                              key: store.formkey,
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Nome completo",
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
                                    validator: (nome) =>
                                        nome != null && nome.length < 10
                                            ? 'Digite um nome válido'
                                            : null,
                                    controller: store.nomeController,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      hintText: "Informe seu nome completo",
                                      filled: true,
                                      fillColor: Colors.grey[300],
                                    ),
                                  ),
                                  SizedBox(height: 25),
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
                                        ? 'Digite um nome válido'
                                        : null,
                                    controller: store.emailController,
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                      hintText: "Informe seu nome completo",
                                      filled: true,
                                      fillColor: Colors.grey[300],
                                    ),
                                  ),
                                  SizedBox(height: 25),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "celular",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  TextFormField(
                                    inputFormatters: [],
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (nome) =>
                                        nome != null && nome.length > 10
                                            ? 'Digite um número válido'
                                            : null,
                                    controller: store.celularController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      hintText: "email@example.com",
                                      filled: true,
                                      fillColor: Colors.grey[300],
                                    ),
                                  ),
                                  SizedBox(height: 25),
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
                                      fillColor: Colors.grey[300],
                                    ),
                                  ),
                                  SizedBox(height: 25),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Confime a senha",
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
                                    validator: (senha) => senha != null &&
                                            senha != store.senhaController.text
                                        ? 'A senha de confimação está diferente'
                                        : null,
                                    controller: store.senhaConfirmaController,
                                    obscureText: true,
                                    obscuringCharacter: '*',
                                    keyboardType: TextInputType.visiblePassword,
                                    decoration: InputDecoration(
                                      hintText: "*********",
                                      filled: true,
                                      fillColor: Colors.grey[300],
                                    ),
                                  ),
                                  SizedBox(height: 25),
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: store.checkBox,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            store.checkBox = value!;
                                          });
                                        },
                                        checkColor: Colors.white,
                                        fillColor: MaterialStateProperty
                                            .resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                            if (states.contains(
                                                MaterialState.selected)) {
                                              return Color(0xFFAE841A);
                                            }
                                            return Color(0xFFAE841A);
                                          },
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          "Ao criar sua conta você concorda com os Termos de Uso e Política de Privacidade",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 50),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size.fromHeight(60),
                                      backgroundColor: Colors.green[700],
                                      textStyle: const TextStyle(
                                        fontSize: 23,
                                      ),
                                    ),
                                    child: const Text('Criar conta'),
                                  ),
                                  SizedBox(height: 25),
                                ],
                              ),
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
