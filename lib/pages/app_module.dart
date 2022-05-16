import 'package:flutter_modular/flutter_modular.dart';
import 'package:shop_client/pages/home/home_module.dart';
import 'package:shop_client/pages/splash/splash_module.dart';

import 'login/login_module.dart';

class AppModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  final List<Bind> binds = [];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: SplashModule()),
    ModuleRoute('/login',
        module: LoginModule(), transition: TransitionType.downToUp),
    ModuleRoute('/home',
        module: HomeModule(), transition: TransitionType.downToUp),
  ];
}
