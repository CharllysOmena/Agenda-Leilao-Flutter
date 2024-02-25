import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../data/models/leilao.dart';

part 'detalhes_leilao_store.g.dart';

class DetalhesLeilaoStore = _DetalhesLeilaoStoreBase with _$DetalhesLeilaoStore;

abstract class _DetalhesLeilaoStoreBase with Store {
  Leilao? leilao;

  recuperarLeilao() => leilao = Modular.args!.data;
}
