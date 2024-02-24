import 'package:agendaleilao/app/modules/home/data/datasources/leiloes_datasource.dart';
import 'package:agendaleilao/app/modules/home/data/repositories/leiloes_aovivo_repository.dart';
import 'package:agendaleilao/app/modules/home/interactor/stores/leiloes_store.dart';
import 'package:agendaleilao/app/modules/login/data/services/auth_login_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'interactor/stores/home_store.dart';
import 'ui/pages/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => Dio()),
    Bind.lazySingleton((i) => LeiloesDatasources(dio: i.get())),
    Bind.lazySingleton((i) => LeiloesRepository(leiloesDatasource: i.get())),
    Bind.lazySingleton((i) => LeiloesStore(leiloesRepository: i.get())),
    Bind.lazySingleton((i) => AuthLoginService(dio: i.get())),
    Bind.lazySingleton((i) => HomeStore(authLoginService: i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
  ];
}
