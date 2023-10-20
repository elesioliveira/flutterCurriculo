import 'package:flutter/material.dart';

import 'package:flutter_curriculo/telaLogin/controlador/auth_controller.dart';
import 'package:flutter_curriculo/validadores/validador.dart';
import 'package:get/get.dart';

class TelaScreen extends StatefulWidget {
  const TelaScreen({super.key});

  @override
  State<TelaScreen> createState() => _TelaScreenState();
}

class _TelaScreenState extends State<TelaScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController? emailController = TextEditingController();
  TextEditingController? paswordController = TextEditingController();
  String email = '';
  String password = '';
  var isLogged = RxBool(true);

  @override
  Widget build(BuildContext context) {
    // Pega o MediaQuery da propriedade size
    Size mediaQuery = MediaQuery.of(context).size;

    // Tamanho total da tela atual em largura
    double maxWidth = mediaQuery.width;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/MC.png'), fit: BoxFit.cover)),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 150, right: 20, left: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromRGBO(255, 255, 255, 0.663),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            label: Text('Email'),
                            hintText: 'digite seu email..',
                            suffixIcon: Icon(Icons.email),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(113, 33, 149, 243),
                                  width: 2.0),
                            ),
                          ),
                          validator: emailValidator,
                          controller: emailController,
                        ),
                        const SizedBox(
                          width: 20,
                          height: 20,
                        ),
                        Obx(() => TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: isLogged.value,
                              decoration: InputDecoration(
                                label: const Text('Senha'),
                                hintText: 'digite sua senha..',
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      isLogged.value = !isLogged.value;
                                    },
                                    child: const Icon(Icons.password)),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(113, 33, 149, 243),
                                      width: 2.0),
                                ),
                              ),
                              controller: paswordController,
                              validator: passwordValidator,
                            )),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text('Esqueceu a senha?'),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: maxWidth,
                          height: 50.0,
                          child: GetX<AuthController>(
                            builder: (controller) {
                              return ElevatedButton(
                                onPressed: controller.isLoading.value
                                    ? null
                                    : () {
                                        if (_formKey.currentState!.validate()) {
                                          email = emailController!.text;
                                          password = paswordController!.text;
                                          controller.signIn(
                                              email: email, password: password);
                                        }
                                      },
                                child: controller.isLoading.value
                                    ? const CircularProgressIndicator()
                                    : const Text(
                                        'Entrar',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                              );
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20, bottom: 15),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.5),
                              color: Colors.blueGrey),
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Cadastre-se',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
