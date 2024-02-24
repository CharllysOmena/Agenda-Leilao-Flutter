import 'package:agendaleilao/app/modules/login/data/services/token_auth_cache.dart';
import 'package:dio/dio.dart';

abstract interface class ILeiloesDatasource {
  Future getLeiloes();
}

class LeiloesDatasources implements ILeiloesDatasource {
  TokenAuthCache tokenAuthCache = TokenAuthCache.instance;
  final Dio dio;

  LeiloesDatasources({required this.dio});

  @override
  Future getLeiloes() async {
    String? token = await tokenAuthCache.getToken();
    var headers = {
      'App': '583f0a5b-c017-4956-b788-a6305767c117',
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    var response = await dio.get(
      "https://bis365.com.br/bid365/api/v1/auctions",
      options: Options(headers: headers),
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return Exception();
    }
  }
}
