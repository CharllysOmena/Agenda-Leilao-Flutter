import 'package:agendaleilao/app/modules/home/data/datasources/leiloes_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group(
    "Categoria datasource",
    () {
      late MockDio dio;
      late LeiloesDatasources leiloesDatasources;
      String url = "https://bis365.com.br/bid365/api/v1/auctions";

      setUp(() {
        dio = MockDio();
        leiloesDatasources = LeiloesDatasources(dio: dio);
      });

      test(
        "Deve retornar os dados caso a requisição seja um sucesso",
        () async {
          final mockResponse = Response(
            requestOptions: RequestOptions(
              path: url,
            ),
            data: data,
            statusCode: 200,
          );

          when(() => dio.get(any()))
              .thenAnswer((invocation) async => mockResponse);
          final result = await leiloesDatasources.getLeiloes();
          verify(() => dio.get(url));
          expect(result, data);
        },
      );

      test("Deve retornar uma exceção quando a requisição falhar", () async {
        final mockResponse = Response(
          requestOptions: RequestOptions(
            path: url,
          ),
          statusCode: 500,
        );
        when(() => dio.get(any()))
            .thenAnswer((invocation) async => mockResponse);
        final result = await leiloesDatasources.getLeiloes();
        expect(result, isA<Exception>());
      });
    },
  );
}

var data = {
  "message": "",
  "data": [
    {
      "id": 1,
      "name": "Leilão Nelore",
      "description": null,
      "date": "2020-12-04",
      "time": "10:00:00",
      "type": 0,
      "contact": "Joaquim",
      "channel": null,
      "link":
          "https://gitlab.com/-/ide/project/eterno/canal-leil-o-api/tree/master/-/routes/web.php/",
      "address": "Ruan CN12",
      "zip_code": "77064-706",
      "image": "auctions/sWOh0cv1fwC1WJPUnfauL5blKuUtCUa8LjeGwJxJ.jpeg",
      "video": null,
      "button_text": null,
      "catalog": "catalogs/iTTyKa6uZlcsRUNfIjO7nNHOb4rln8ZFYzr6sOnZ.pdf",
      "is_enabled": 1,
      "is_featured": 1,
      "auction_house_id": 1,
      "city_id": 443,
      "player": 1,
      "local": 1,
      "status": 1,
      "phone": "(63) 94894-8588",
      "created_at": "2020-12-03T19:17:48.000000Z",
      "updated_at": "2020-12-03T19:17:48.000000Z",
      "auctionhouse": "Eduarda e Luan Eletrônica",
      "city": "Palmas - TO",
      "catalog_url":
          "http://localhost:8080/storage/catalogs/iTTyKa6uZlcsRUNfIjO7nNHOb4rln8ZFYzr6sOnZ.pdf"
    }
  ]
};
