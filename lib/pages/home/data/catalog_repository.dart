import 'package:shop_client/network/catalog_api.dart';
import 'package:shop_client/network/dto/catalog_dto.dart';

abstract class CatalogRepository {
  Future<CatalogPageDto> getCatalogPage(int pageIndex);
}

class CatalogRepositoryImpl extends CatalogRepository {
  final CatalogApi _catalogApi;

  CatalogRepositoryImpl(this._catalogApi);

  @override
  Future<CatalogPageDto> getCatalogPage(int pageIndex) {
    // TODO: use the page index to get the wanted page
    return _catalogApi.getProducts();
  }
}
