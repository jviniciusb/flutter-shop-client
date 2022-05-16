import 'package:flutter_modular/flutter_modular.dart';
import 'package:shop_client/network/network_module.dart';
import 'package:shop_client/pages/home/data/catalog_repository.dart';
import 'package:shop_client/pages/home/domain/download_catalog_page_usecase.dart';
import 'package:shop_client/pages/home/ui/home_viewmodel.dart';

import 'ui/home_page.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        NetworkModule(),
      ];

  @override
  final List<Bind> binds = [
    Bind.factory<CatalogRepository>(
      (i) => CatalogRepositoryImpl(i()),
    ),
    Bind.factory<DownloadCatalogPageUseCase>(
      (i) => DownloadCatalogPageUseCaseImpl(i()),
    ),
    Bind.lazySingleton((i) => HomeViewModel(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HomePage()),
  ];
}
