import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shop_client/network/catalog_api.dart';

class NetworkModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => Dio(), export: true),
        Bind.lazySingleton((i) => CatalogApi(i()), export: true),
      ];
}
