import 'package:agendaleilao/app/modules/home/data/models/leilao.dart';
import 'package:mobx/mobx.dart';

import '../../data/repositories/leiloes_aovivo_repository.dart';
import '../states/leiloes_state.dart';

part 'leiloes_store.g.dart';

class LeiloesStore = _LeiloesStoreBase with _$LeiloesStore;

abstract class _LeiloesStoreBase with Store {
  final ILeiloesRepository leiloesRepository;

  _LeiloesStoreBase({required this.leiloesRepository});

  @observable
  LeiloesState state = const StartLeiloesState();

  List<Leilao> leiloes = [];

  @action
  Future getLeiloes() async {
    state = const LoadingLeiloesState();
    LeiloesState response = await leiloesRepository.getLeilao();
    if (response is SuccessLeiloesState) {
      leiloes = response.leiloes;
      state = response;
    } else {
      state = response;
    }
  }
}
