import 'package:flutter/material.dart';
import 'package:flutter_curriculo/telaLogin/controlador/auth_controller.dart';
import 'package:get/get.dart';

import 'baseScreen/Controller/base_controller.dart';
import 'clientes/controller/cliente_controller.dart';
import 'componentes/tema.dart';
import 'pages/pages_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(AuthController());
  Get.put(PageViewController());
  Get.put(ClienteController());
  Get.put(ThemeController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.native,
      locale: const Locale('pt', 'BR'),
      theme: ThemeData.light(),
      initialRoute: PagesRoutes.loginScreen,
      initialBinding: BindingsBuilder(() {}),
      getPages: AppPages.pages,
    );
  }
}
