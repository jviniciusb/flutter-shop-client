import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shop_client/network/dto/catalog_dto.dart';
import 'package:shop_client/pages/home/domain/download_catalog_page_usecase.dart';

part 'home_viewmodel.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store implements Disposable {
  final DownloadCatalogPageUseCase _downloadCatalogPageUseCase;

  _HomeViewModelBase(this._downloadCatalogPageUseCase);

  List<ProductDto> produtcts = <ProductDto>[];

  @observable
  bool isLoading = false;

  @action
  loadProducts() async {
    isLoading = true;
    var productsResponse = await _downloadCatalogPageUseCase.execute(0);
    produtcts = productsResponse;
    isLoading = false;
  }

  @action
  filterProducts(String query) async {
    if (query.isEmpty || query.length >= 3) {
      isLoading = true;
      var productsResponse = await _downloadCatalogPageUseCase.execute(0);
      produtcts = productsResponse
          .where((p) =>
              p.name?.toLowerCase().contains(query.toLowerCase()) ?? false)
          .toList();
      isLoading = false;
    }
  }

  @override
  void dispose() {
    //
  }
}
