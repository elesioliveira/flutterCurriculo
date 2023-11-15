import 'package:get/get.dart';

import '../baseScreen/view/base_screen.dart';
import '../clientes/view/clientes_view.dart';
import '../clientes/view/novo_cliente.dart';
import '../homeScreen/view/home_screen.dart';
import '../instagram/view/instagram.dart';
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
    GetPage(
      name: PagesRoutes.homeScreen,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: PagesRoutes.novoCliente,
      page: () => NovoCliente(),
    ),
    GetPage(
      name: PagesRoutes.instagram,
      page: () => Instagram(),
    ),
  ];
}

abstract class PagesRoutes {
  static const String clienteRoute = '/cliente';
  static const String loginScreen = '/login';
  static const String baseScreen = '/base';
  static const String homeScreen = '/home';
  static const String novoCliente = '/novoCliente';
  static const String instagram = '/instagram';
}
