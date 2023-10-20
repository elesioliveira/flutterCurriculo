import 'package:flutter_curriculo/telaLogin/autenticacao/autentica%C3%A7%C3%A3oResultado/auth_result.dart';
// import 'package:flutter_curriculo/telaLogin/model/user_model.dart';
import 'package:flutter_curriculo/telaLogin/repositorio/auth_repository.dart';
import 'package:get/get.dart';

import '../../pages/pages_routes.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  final AuthRepository authRepository = AuthRepository();

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;

    AuthResult result = await authRepository.signIn(
      email: email,
      password: password,
    );
    isLoading.value = false;
    result.when(
        success: (user) {
          Get.offAllNamed(PagesRoutes.clienteRoute);
        },
        error: (message) {});
  }
}
