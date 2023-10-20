import 'package:flutter/material.dart';
import 'package:flutter_curriculo/telaLogin/controlador/auth_controller.dart';
import 'package:get/get.dart';

import 'baseScreen/Controller/base_controller.dart';
import 'baseScreen/view/base_screen.dart';
import 'pages/pages_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(AuthController());
  Get.put(PageViewController());

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
      initialRoute: PagesRoutes.baseScreen,
      getPages: AppPages.pages,
    );
  }
}
