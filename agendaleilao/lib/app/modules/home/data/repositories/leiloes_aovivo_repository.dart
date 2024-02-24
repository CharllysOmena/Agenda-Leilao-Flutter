import 'package:agendaleilao/app/modules/home/data/adapters/leilao_adapters.dart';
import 'package:agendaleilao/app/modules/home/data/datasources/leiloes_datasource.dart';
import 'package:agendaleilao/app/modules/home/data/models/leilao.dart';
import 'package:agendaleilao/app/modules/home/interactor/states/leiloes_state.dart';

abstract interface class ILeiloesRepository {
  Future<LeiloesState> getLeilao();
}

class LeiloesRepository implements ILeiloesRepository {
  final ILeiloesDatasource leiloesDatasource;

  LeiloesRepository({required this.leiloesDatasource});

  @override
  Future<LeiloesState> getLeilao() async {
    List<Leilao> leiloes;
    try {
      var response = await leiloesDatasource.getLeiloes();
      List<dynamic> body = response["data"];
      leiloes = body.map((json) => LeilaoAdapter.fromJson(json)).toList();
      return SuccessLeiloesState(leiloes: leiloes);
    } catch (e) {
      return const ErrorExceptionLeiloesState();
    }
  }
}
