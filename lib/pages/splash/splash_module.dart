import 'package:flutter_modular/flutter_modular.dart';

import 'ui/splash_page.dart';
import 'ui/splash_viewmodel.dart';

class SplashModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SplashViewModel()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => SplashPage()),
  ];
}
