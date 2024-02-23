import 'package:agendaleilao/app/modules/login/data/services/auth_login_service.dart';
import 'package:agendaleilao/app/modules/login/interactor/stores/cadastro_store.dart';
import 'package:agendaleilao/app/modules/login/ui/pages/cadastro_page.dart';
import 'package:agendaleilao/app/modules/login/ui/pages/login_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'interactor/stores/login_store.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => Dio()),
    Bind.lazySingleton((i) => AuthLoginService(dio: i.get())),
    Bind.lazySingleton((i) => LoginStore(authLoginService: i.get())),
    Bind.lazySingleton((i) => CadastroStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => LoginPage()),
    ChildRoute("/cadastro", child: (_, args) => CadastroPage()),
  ];
}
