import 'package:flutter_modular/flutter_modular.dart';
import 'package:shop_client/pages/login/data/login_repository.dart';
import 'package:shop_client/pages/login/domain/login_usecase.dart';

import 'ui/login_page.dart';
import 'ui/login_viewmodel.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory<LoginRepository>((i) => LoginRepositoryImpl()),
    Bind.factory<LoginUseCase>((i) => LoginUseCaseImpl(i())),
    Bind.lazySingleton((i) => LoginViewModel(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => LoginPage()),
  ];
}
