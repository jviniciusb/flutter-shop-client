import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_client/res/assets.dart';
import 'package:shop_client/res/dimens.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.currencySymbol,
    required this.press,
    required this.bgColor,
  }) : super(key: key);

  final String image, title;
  final VoidCallback press;
  final double price;
  final String currencySymbol;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.all(DimensRes.xsmallSpace),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.all(Radius.circular(DimensRes.defaultRadius)),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(DimensRes.defaultRadius),
                  ),
                ),
                child: CachedNetworkImage(
                  imageUrl: image,
                  placeholder: (context, url) => Padding(
                    padding: const EdgeInsets.all(DimensRes.xsmallSpace),
                    child: SvgPicture.asset(AssetsRes.saleIcon),
                  ),
                  errorWidget: (context, url, error) => Padding(
                    padding: const EdgeInsets.all(DimensRes.xsmallSpace),
                    child: SvgPicture.asset(AssetsRes.saleIcon),
                  ),
                ),
              ),
            ),
            const SizedBox(height: DimensRes.defaultSpace),
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(width: DimensRes.defaultSpace),
                Text(
                  currencySymbol + price.toString(),
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
