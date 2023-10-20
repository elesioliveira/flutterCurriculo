import 'package:flutter_curriculo/constantes/endpoints.dart';
import 'package:flutter_curriculo/telaLogin/autenticacao/autentica%C3%A7%C3%A3oResultado/auth_result.dart';
import 'package:flutter_curriculo/telaLogin/model/user_model.dart';
import 'auth_erro.dart' as auth_erros;
import '../../serviços/httpManager/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  AuthResult handleUserOrError(Map<dynamic, dynamic> result) {
    if (result['result'] != null) {
      final user = UserModel.fromJson(result['result']);
      return AuthResult.success(user);
    } else {
      return AuthResult.error(auth_erros.authErrorsString(result['error']));
    }
  }

  Future<AuthResult> signIn({
    required String email,
    required String password,
  }) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.signin,
      method: HttpMethods.post,
      body: {
        'email': email,
        'password': password,
      },
    );
    return handleUserOrError(result);
  }
}
