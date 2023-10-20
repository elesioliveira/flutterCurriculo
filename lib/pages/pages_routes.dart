import 'package:get/get.dart';

import '../baseScreen/view/base_screen.dart';
import '../clientes/view/clientes_view.dart';
import '../telaLogin/tela_login.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: PagesRoutes.clienteRoute,
      page: () => const ClienteScreen(),
      // bindings: [
      //   ClienteBinding(),
      // ],
    ),
    GetPage(
      name: PagesRoutes.loginScreen,
      page: () => const TelaScreen(),
    ),
    GetPage(
      name: PagesRoutes.baseScreen,
      page: () => const BaseScreen(),
    ),
  ];
}

abstract class PagesRoutes {
  static const String clienteRoute = '/cliente';
  static const String loginScreen = '/login';
  static const String baseScreen = '/base';
}
