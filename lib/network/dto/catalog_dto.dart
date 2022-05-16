import 'package:json_annotation/json_annotation.dart';

part 'catalog_dto.g.dart';

@JsonSerializable()
class CatalogPageDto {
  List<ProductDto>? data;
  int? pageSize;
  int? pageIndex;
  int? count;
  int? totalPages;

  CatalogPageDto(
      {this.data, this.pageSize, this.pageIndex, this.count, this.totalPages});

  factory CatalogPageDto.fromJson(Map<String, dynamic> json) =>
      _$CatalogPageDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CatalogPageDtoToJson(this);
}

@JsonSerializable()
class ProductDto {
  IdDto? catalogItemId;
  String? name;
  String? description;
  PriceDto? price;
  double? value;
  String? currency;
  int? availableStock;
  String? pictureName;
  String? pictureUri;
  BrandDto? catalogBrand;
  String? pictureBase64;

  ProductDto(
      {this.catalogItemId,
      this.name,
      this.description,
      this.price,
      this.value,
      this.currency,
      this.availableStock,
      this.pictureName,
      this.pictureUri,
      this.catalogBrand,
      this.pictureBase64});

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDtoToJson(this);
}

@JsonSerializable()
class IdDto {
  String? id;

  IdDto({this.id});

  factory IdDto.fromJson(Map<String, dynamic> json) => _$IdDtoFromJson(json);

  Map<String, dynamic> toJson() => _$IdDtoToJson(this);
}

@JsonSerializable()
class PriceDto {
  double? value;
  CurrencyDto? currency;

  PriceDto({this.value, this.currency});

  factory PriceDto.fromJson(Map<String, dynamic> json) =>
      _$PriceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PriceDtoToJson(this);
}

@JsonSerializable()
class CurrencyDto {
  String? code;

  CurrencyDto({this.code});

  factory CurrencyDto.fromJson(Map<String, dynamic> json) =>
      _$CurrencyDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyDtoToJson(this);
}

@JsonSerializable()
class BrandDto {
  IdDto? catalogBrandId;
  String? brand;

  BrandDto({this.catalogBrandId, this.brand});

  factory BrandDto.fromJson(Map<String, dynamic> json) =>
      _$BrandDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BrandDtoToJson(this);
}
