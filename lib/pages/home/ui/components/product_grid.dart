import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:shop_client/network/dto/catalog_dto.dart';
import 'package:shop_client/res/colors.dart';
import 'package:shop_client/res/dimens.dart';

import 'product_card.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    Key? key,
    required this.products,
  }) : super(key: key);

  final List<ProductDto> products;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      child: GridView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: DimensRes.xsmallSpace,
            crossAxisSpacing: DimensRes.samllSpace,
            childAspectRatio: 3 / 4,
          ),
          itemCount: products.length,
          itemBuilder: (BuildContext _, int index) {
            var p = products[index];
            return ProductCard(
                image: p.pictureUri ?? '',
                title: p.name ?? '',
                price: p.price?.value ?? 0.0,
                currencySymbol: p.price?.currency?.code ?? '',
                press: () {
                  asuka.showSnackBar(SnackBar(
                    content: Text(p.name ?? ''),
                  ));
                },
                bgColor: ColorsRes.cardBgColor);
          }),
    );
  }
}
