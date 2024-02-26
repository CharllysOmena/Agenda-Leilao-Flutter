import 'package:agendaleilao/app/modules/login/data/services/token_auth_cache.dart';
import 'package:agendaleilao/app/modules/login/interactor/states/auth_login_state.dart';
import 'package:dio/dio.dart';

import '../models/usuario.dart';

abstract interface class IAuthLoginService {
  Future<AuthLoginState> signIn(Usuario usuario);
  Future logOut();
}

class AuthLoginService implements IAuthLoginService {
  final Dio dio;
  TokenAuthCache tokenAuthCache = TokenAuthCache.instance;

  AuthLoginService({required this.dio});

  @override
  Future<AuthLoginState> signIn(Usuario usuario) async {
    var headers = {
      'App': '583f0a5b-c017-4956-b788-a6305767c117',
      'Content-Type': 'application/json'
    };
    try {
      var response = await dio.post(
        "https://bis365.com.br/bid365/api/v1/auth/login",
        data: usuario.toJsonLogin(),
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        String token = response.data["data"]["token"];
        return SuccessAuthLoginState(token: token);
      } else {
        return const EmptyAuthLoginState();
      }
    } catch (e) {
      return const ErrorExceptionAuthLoginState();
    }
  }

  @override
  Future logOut() async {
    String? token = await tokenAuthCache.getToken();
    var headers = {
      'App': '583f0a5b-c017-4956-b788-a6305767c117',
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    String url = "https://bis365.com.br/bid365/api/v1/auth/logout";
    try {
      var response = await dio.delete(url, options: Options(headers: headers));
      await tokenAuthCache.deleteToken();
    } catch (e) {
      print(e);
    }
  }
}
