import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shop_client/pages/home/ui/home_viewmodel.dart';
import 'package:shop_client/res/colors.dart';
import 'package:shop_client/res/dimens.dart';
import 'package:shop_client/res/strings.dart';

import 'components/product_grid.dart';
import 'components/search_form.dart';

class HomePage extends StatelessWidget {
  final HomeViewModel _homeViewModel = Modular.get<HomeViewModel>();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _homeViewModel.loadProducts();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu_rounded,
            color: Colors.black54,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              StringsRes.appName,
              style: TextStyle(
                fontSize: DimensRes.defaultText,
                color: ColorsRes.textColor,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Badge(
              badgeContent: const Text(
                '0',
                style: TextStyle(
                  fontSize: DimensRes.smallText,
                  color: Colors.white,
                ),
              ),
              child: const Icon(
                Icons.shopping_cart,
                color: Colors.black54,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: DimensRes.mediumSpace,
          vertical: DimensRes.bigSpace,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Explore",
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
            ),
            const Text(
              StringsRes.bestProductsLabel,
              style: TextStyle(
                fontSize: DimensRes.defaultText,
                color: ColorsRes.textColor,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: DimensRes.defaultSpace),
              child: SearchForm(searchCallback: (query) {
                _homeViewModel.filterProducts(query);
              }),
            ),
            Observer(builder: (_) {
              if (_homeViewModel.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                var products = _homeViewModel.produtcts;
                return ProductGrid(products: products);
              }
            })
          ],
        ),
      ),
    );
  }
}
