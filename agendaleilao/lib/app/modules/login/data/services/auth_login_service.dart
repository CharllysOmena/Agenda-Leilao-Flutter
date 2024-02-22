import 'package:agendaleilao/app/modules/login/interactor/states/auth_login_state.dart';
import 'package:dio/dio.dart';

import '../models/usuario.dart';

abstract interface class IAuthLoginService {
  Future<AuthLoginState> signIn(Usuario usuario);
  Future signOut();
}

class AuthLoginService implements IAuthLoginService {
  final Dio dio;

  AuthLoginService({required this.dio});

  @override
  Future<AuthLoginState> signIn(Usuario usuario) async {
    String url = "https://bis365.com.br/bid365/api/v1/auth/login-client";
    Map<String, dynamic> userData = usuario.toJson();
    try {
      var response = await dio.post(url, data: userData);
      if (response.statusCode == 200) {
        print(response.data);
        return const SuccessAuthLoginState();
      } else {
        return const EmptyAuthLoginState();
      }
    } catch (e) {
      print("$e");
      return const ErrorExceptionAuthLoginState();
    }
  }

  @override
  Future signOut() async {
    String token = "583f0a5b-c017-4956-b788-a6305767c117";
    dio.options.headers['Authorization'] = 'Bearer $token';
    String url = "https://bis365.com.br/bid365/api/v1/auth/logout";
    try {
      var response = await dio.delete(url);
      if (response.statusCode == 200) {
        print(response.data);
      } else {
        print("não foi possivel");
      }
    } catch (e) {
      print(e);
    }
  }
}

void main() {
  Dio dio = Dio();
  Usuario usuario = Usuario(email: "fabioln@ldix.com", senha: "1234567o");
  AuthLoginService authLoginService = AuthLoginService(dio: dio);
  authLoginService.signOut();
}
