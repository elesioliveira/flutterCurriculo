import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../clientes/controller/cliente_controller.dart';
import '../../componentes/tema.dart';
import '../../pages/pages_routes.dart';
import '../Controller/base_controller.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  bool isOpenDrawer = false;
  PageViewController controller = Get.find<PageViewController>();
  ClienteController allClientes = Get.find<ClienteController>();
  RxBool isTrue = false.obs;
  ThemeController themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        backgroundColor: const Color.fromARGB(50, 110, 160, 210),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(10, 60, 110, 160),
              ),
              child: Text(
                'Menu Lateral',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              onTap: () async {
                await allClientes.getAllPerson();

                if (allClientes.allPerson.isEmpty) {
                  final scaffoldMessenger = ScaffoldMessenger.of(context);
                  scaffoldMessenger.showSnackBar(
                    const SnackBar(
                      content: Text('Ocorreu um erro!'),
                      backgroundColor: Colors.red,
                      behavior: SnackBarBehavior
                          .floating, // Isso torna a SnackBar flutuante na parte inferior
                    ),
                  );
                } else {
                 
                  Get.toNamed(PagesRoutes.clienteRoute);
                }
              },
              iconColor: Colors.white,
              textColor: Colors.white,
              title: const Text(
                'Clientes',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Pesquisar..'),
              trailing: const Icon(Icons.person),
            ),
            const SizedBox(
              height: 10,
            ),
            const ListTile(
              iconColor: Colors.white,
              textColor: Colors.white,
              title: Text(
                'Estoque',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Consultar estoque'),
              trailing: Icon(Icons.add_box_outlined),
            ),
            const SizedBox(
              height: 10,
            ),
            const ListTile(
              iconColor: Colors.white,
              textColor: Colors.white,
              title: Text(
                'Vendas',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Historico'),
              trailing: Icon(Icons.outbond_outlined),
            ),
            ListTileTheme(
              style: ListTileStyle.drawer,
              child: Positioned(
                child: Obx(
                  () => Switch(
                    activeColor: themeController.isDarkMode.value
                        ? Colors.black
                        : Colors.white,
                    value: themeController.isDarkMode.value,
                    onChanged: (value) {
                      themeController.toggleTheme();
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'BaseScreen',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: GetBuilder<PageViewController>(
        builder: (pageController) {
          return PageView(
              allowImplicitScrolling: false,
              controller: pageController.pageController,
              children: [
                Container(
                  color: Colors.blue,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('OpenDrawer'),
                    ),
                  ),
                ),
                Container(
                    color: Colors.green,
                    child: const Center(
                      child: Text('Page 2'),
                    )),
                Container(
                  color: Colors.orange,
                  child: const Center(
                    child: Text('Page 3'),
                  ),
                )
              ]);
        },
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentPage.value,
          onTap: (index) {
            controller.changePage(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Page 1',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Page 2',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Page 3',
            ),
          ],
        ),
      ),
    );
  }
}
