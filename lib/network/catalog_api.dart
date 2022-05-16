import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shop_client/network/dto/catalog_dto.dart';

part 'catalog_api.g.dart';

const catalogBaseUrl =
    "http://192.168.15.75:5000/api/v1/catalog"; //"https://eastus2-catalog-api-dev.azurewebsites.net/api/v1/catalog";

@RestApi(baseUrl: catalogBaseUrl)
abstract class CatalogApi {
  factory CatalogApi(Dio dio, {String baseUrl}) = _CatalogApi;

  @GET("/items?pageSize=10&pageIndex=0")
  Future<CatalogPageDto> getProducts();
}
