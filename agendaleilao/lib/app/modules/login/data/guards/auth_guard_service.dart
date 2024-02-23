import 'package:agendaleilao/app/modules/login/data/services/token_auth_cache.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthGuardService implements RouteGuard {
  TokenAuthCache tokenAuthCache = TokenAuthCache.instance;

  @override
  Future<bool> canActivate(String path, ModularRoute router) async {
    return await tokenAuthCache.hasToken();
  }

  @override
  String? get guardedRoute => '/login';
}
