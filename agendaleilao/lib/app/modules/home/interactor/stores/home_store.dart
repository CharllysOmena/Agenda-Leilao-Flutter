import 'package:agendaleilao/app/modules/login/data/services/auth_login_service.dart';
import 'package:agendaleilao/app/modules/login/data/services/token_auth_cache.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final IAuthLoginService authLoginService;
  TokenAuthCache tokenAuthCache = TokenAuthCache.instance;

  HomeStoreBase({required this.authLoginService});

  @action
  Future logOut() async {
    String? token = await tokenAuthCache.getToken();
    await authLoginService.logOut(token);
    await tokenAuthCache.deleteToken();
    Modular.to.navigate("/login");
  }
}
