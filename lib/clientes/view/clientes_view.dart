import 'package:flutter/material.dart';
import 'package:flutter_curriculo/pages/pages_routes.dart';
import 'package:get/get.dart';

import '../../componentes/tema.dart';
import '../controller/cliente_controller.dart';

class ClienteScreen extends StatefulWidget {
  const ClienteScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ClienteScreenState createState() => _ClienteScreenState();
}

class _ClienteScreenState extends State<ClienteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColorPalette.primaryColor,
        title: const Text('Clientes'),
        centerTitle: true,
      ),
      body: GetBuilder<ClienteController>(
        builder: (controller) {
          return ListView.builder(
            itemCount: controller.allPerson.length,
            padding: const EdgeInsets.symmetric(vertical: 15),
            itemBuilder: (BuildContext context, index) {
              return Dismissible(
                background: Container(
                  color: Colors.red,
                  child: const Icon(Icons.delete),
                ),
                key: ValueKey<int>(controller.allPerson[index].id),
                onDismissed: (direction) {
                  controller.allPerson.removeAt(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          20), // Define o raio dos cantos arredondados
                      border: Border.all(
                          width: 2,
                          color: CustomColorPalette
                              .tertiaryColor), // Adicione uma borda ao redor do contêiner
                    ),
                    child: ListTile(
                      selected: false,
                      leading: const Icon(Icons.person),
                      titleTextStyle:
                          TextStyle(color: CustomColorPalette.primaryColor),
                      iconColor: CustomColorPalette.tertiaryColor,
                      title: Text(
                        controller.allPerson[index].title,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: ElevatedButton.icon(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10.0), // Define o raio das bordas
              ),
            ),
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.green; //botão sendo pressionado
                } else if (states.contains(MaterialState.disabled)) {
                  return Colors.orange; // botão desabilitado
                }
                return CustomColorPalette.primaryColor; //botão em estado neutro
              },
            ),
          ),
          onPressed: () {
            Get.toNamed(PagesRoutes.novoCliente);
          },
          icon: const Icon(Icons.add),
          label: const Text('Novo cliente')),
    );
  }
}
