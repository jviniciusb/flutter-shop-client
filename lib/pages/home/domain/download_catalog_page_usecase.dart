import 'package:shop_client/network/dto/catalog_dto.dart';
import 'package:shop_client/pages/home/data/catalog_repository.dart';

abstract class DownloadCatalogPageUseCase {
  Future<List<ProductDto>> execute(int pageIndex);
}

class DownloadCatalogPageUseCaseImpl extends DownloadCatalogPageUseCase {
  final CatalogRepository _catalogRepository;

  DownloadCatalogPageUseCaseImpl(this._catalogRepository);

  @override
  Future<List<ProductDto>> execute(int pageIndex) async {
    var page = await _catalogRepository.getCatalogPage(pageIndex);
    return Future.value(page.data);
  }
}
