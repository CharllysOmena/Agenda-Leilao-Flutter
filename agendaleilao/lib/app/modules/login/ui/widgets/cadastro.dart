import 'package:agendaleilao/app/modules/login/ui/widgets/masks.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import '../../interactor/stores/cadastro_store.dart';

class Cadastro extends StatefulWidget {
  final CadastroStore store;
  const Cadastro({super.key, required this.store});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
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
                SizedBox(height: 20),
                Form(
                  key: widget.store.formkey,
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (nome) => nome != null && nome.length < 10
                            ? 'Digite um nome válido'
                            : null,
                        controller: widget.store.nomeController,
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (email) =>
                            email != null && !EmailValidator.validate(email)
                                ? 'Digite um email válido'
                                : null,
                        controller: widget.store.emailController,
                        keyboardType: TextInputType.name,
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
                          "celular",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        inputFormatters: [Mask().maskCell],
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (numero) => numero!.length < 15
                            ? 'Digite um número válido'
                            : null,
                        controller: widget.store.celularController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "(82) 99999-9999",
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (senha) => senha != null && senha.length < 6
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (senha) => senha != null &&
                                senha != widget.store.senhaController.text
                            ? 'A senha de confimação está diferente'
                            : null,
                        controller: widget.store.senhaConfirmaController,
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
                            value: widget.store.checkBox,
                            onChanged: (bool? value) {
                              setState(() {
                                widget.store.checkBox = value!;
                              });
                            },
                            checkColor: Colors.white,
                            fillColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.selected)) {
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
                        onPressed: () {
                          if (widget.store.formkey.currentState!.validate()) {
                            if (widget.store.checkBox == true) {
                            } else {
                              widget.store.mensagem();
                            }
                          }
                        },
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
  }
}
