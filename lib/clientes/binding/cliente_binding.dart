import 'package:flutter_curriculo/clientes/controller/cliente_controller.dart';
import 'package:get/get.dart';

class ClienteBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ClienteController());
  }
}
