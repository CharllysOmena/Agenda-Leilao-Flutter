import 'package:agendaleilao/app/modules/login/data/guards/auth_guard_service.dart';
import 'package:agendaleilao/app/modules/splashScreen/splashScreen_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashScreenModule()),
    ModuleRoute("/home", module: HomeModule(), guards: [AuthGuardService()]),
    ModuleRoute("/login", module: LoginModule()),
  ];
}
