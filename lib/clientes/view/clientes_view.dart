import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        title: const Text('Deu certo'),
        centerTitle: true,
      ),
      body: GetBuilder<ClienteController>(
        builder: (controller) {
          return Container(
              padding: const EdgeInsets.all(8),
              child: controller.isLoading.value
                  ? ListView.separated(
                      itemCount: controller.allPerson.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                              controller.allPerson[index].title.toString()),
                          tileColor: Colors.orangeAccent,
                          onTap: () {},
                          leading: const Icon(Icons.person),
                          trailing: const Icon(Icons.menu),
                        );
                      },
                      separatorBuilder: ((context, index) => const Divider()),
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                        color: Color.fromARGB(185, 35, 81, 99),
                      ),
                    ));
        },
      ),
    );
  }
}
