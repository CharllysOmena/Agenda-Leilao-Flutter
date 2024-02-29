import 'package:dio/dio.dart';

abstract interface class IEsqueciSenhaDatasource {
  Future recuperarSenha(String email);
}

class EsqueciSenhaDatasource implements IEsqueciSenhaDatasource {
  final Dio dio;

  EsqueciSenhaDatasource({required this.dio});

  @override
  Future recuperarSenha(String email) async {
    var headers = {
      'App': '583f0a5b-c017-4956-b788-a6305767c117',
      'Content-Type': 'application/json'
    };
    var response = await dio.post(
      "https://bis365.com.br/bid365/api/v1/auth/password/email",
      data: {"email": email},
      options: Options(headers: headers),
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return Exception();
    }
  }
}
