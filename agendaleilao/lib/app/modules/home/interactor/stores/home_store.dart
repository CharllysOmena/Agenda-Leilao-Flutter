import 'package:agendaleilao/app/modules/login/data/services/auth_login_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final IAuthLoginService authLoginService;

  HomeStoreBase({required this.authLoginService});

  List<String> titulos = ["Leilões ao-vivo", "Leilões agendados"];

  @observable
  int indice = 0;

  @action
  Future logOut() async {
    await authLoginService.logOut();
    Modular.to.navigate("/login");
  }

  @action
  int trocarIndice(int novoIndice) => indice = novoIndice;
}
