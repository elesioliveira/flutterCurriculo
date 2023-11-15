import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:search_cep/search_cep.dart';

import '../../componentes/tema.dart';
import '../controller/cliente_controller.dart';
import '../model/person_model.dart';

class NovoCliente extends StatelessWidget {
  NovoCliente({
    super.key,
  });
  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerTelefone = TextEditingController();
  TextEditingController controllerEndereco = TextEditingController();
  TextEditingController controllerNumero = TextEditingController();
  ClienteController clienteController = Get.find<ClienteController>();
  final _formKey = GlobalKey<FormState>();
  final viaCepSearchCep = ViaCepSearchCep();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 231, 231),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(80),
                  ),
                  color: CustomColorPalette.primaryColor),
              child: const Center(
                child: Text(
                  'NOVO CLIENTE',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 50,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: controllerNome,
                      icon: const Icon(Icons.person_2),
                      colorIcon: CustomColorPalette.tertiaryColor,
                      hintText: 'Nome',
                      label: const Text('Nome'),
                      color: CustomColorPalette.tertiaryColor,
                      colorFocus: CustomColorPalette.tertiaryColor,
                    ),
                    TextFormField(
                      controller: controllerTelefone,
                      keyboardType: TextInputType.phone,
                      icon: const Icon(Icons.phone_android),
                      colorIcon: CustomColorPalette.tertiaryColor,
                      hintText: 'Telefone',
                      label: const Text('Telefone'),
                      color: CustomColorPalette.tertiaryColor,
                      colorFocus: CustomColorPalette.tertiaryColor,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.streetAddress,
                      controller: controllerEndereco,
                      icon: const Icon(Icons.streetview),
                      colorIcon: CustomColorPalette.tertiaryColor,
                      hintText: 'Endereço',
                      label: const Text('Endereço'),
                      color: CustomColorPalette.tertiaryColor,
                      colorFocus: CustomColorPalette.tertiaryColor,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: controllerNumero,
                      icon: const Icon(Icons.maps_home_work),
                      colorIcon: CustomColorPalette.tertiaryColor,
                      suffixIcon: GestureDetector(
                          onTap: () async {
                            final infoCepJSON = await viaCepSearchCep
                                .searchInfoByCep(cep: controllerNumero.text);
                            final resultado = infoCepJSON;

                            resultado.fold((erro) {}, (ViaCepInfo) {
                              if (controllerEndereco.text.isNotEmpty) {
                                controllerEndereco.text = '';
                                controllerEndereco.text =
                                    ViaCepInfo.logradouro.toString();
                              } else {
                                controllerEndereco.text =
                                    ViaCepInfo.logradouro.toString();
                              }
                            });
                          },
                          child: const Icon(Icons.maps_home_work)),
                      hintText: 'CEP',
                      label: const Text('Cep'),
                      color: CustomColorPalette.tertiaryColor,
                      colorFocus: CustomColorPalette.tertiaryColor,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, top: 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton.icon(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Define o raio das bordas
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.red; //botão sendo pressionado
                          } else if (states.contains(MaterialState.disabled)) {
                            return Colors.orange; // botão desabilitado
                          }
                          return CustomColorPalette
                              .primaryColor; //botão em estado neutro
                        },
                      ),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close),
                    label: const Text(
                      'Cancelar',
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Define o raio das bordas
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.green; //botão sendo pressionado
                          } else if (states.contains(MaterialState.disabled)) {
                            return Colors.orange; // botão desabilitado
                          }
                          return CustomColorPalette
                              .secondaryColor; //botão em estado neutro
                        },
                      ),
                    ),
                    onPressed: () async {
                      String nome = controllerNome.text;
                      String endereco = controllerEndereco.text;
                      int telefone = int.parse(controllerTelefone.text);
                      int numero = int.parse(controllerNumero.text);
                      PersonModel novoCliente = PersonModel(
                        id: numero,
                        title: nome,
                        body: endereco,
                        userId: telefone,
                      );
                      clienteController.allPerson.insert(0, novoCliente);
                      Get.back();
                      print(clienteController.allPerson.length);
                    },
                    icon: const Icon(Icons.done),
                    label: const Text(
                      'Salvar',
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFormField extends StatefulWidget {
  TextFormField(
      {super.key,
      this.icon,
      this.colorIcon,
      this.hintText,
      this.label,
      required this.color,
      required this.colorFocus,
      this.controller,
      this.suffixIcon,
      this.keyboardType});

  Icon? icon;
  Color? colorIcon;
  String? hintText;
  Color color;
  Widget? label;
  Color colorFocus;
  TextEditingController? controller;
  Widget? suffixIcon;
  TextInputType? keyboardType;

  @override
  State<TextFormField> createState() => _TextFormFieldState();
}

class _TextFormFieldState extends State<TextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 15,
                  color: widget.color,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  borderSide:
                      BorderSide(color: CustomColorPalette.primaryColor)),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(
                  color: widget
                      .colorFocus, // Cor das bordas quando o campo está em foco
                  width: 2.0, // Largura das bordas em foco
                ),
              ),
              icon: widget.icon,
              suffixIcon: widget.suffixIcon,
              labelStyle: TextStyle(color: CustomColorPalette.primaryColor),
              iconColor: widget.colorIcon,
              hintText: widget.hintText,
              hintStyle: TextStyle(color: CustomColorPalette.primaryColor),
              label: widget.label),
        ),
      ),
    );
  }
}
