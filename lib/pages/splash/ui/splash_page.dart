import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_client/res/assets.dart';
import 'package:shop_client/res/colors.dart';

import 'splash_viewmodel.dart';

class SplashPage extends StatelessWidget {
  final splashViewModel = Modular.get<SplashViewModel>();

  SplashPage({Key? key}) : super(key: key) {
    splashViewModel.startCountDown();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsRes.backgroundColor,
      child: Center(
        child: SvgPicture.asset(
          AssetsRes.bagIcon,
          width: MediaQuery.of(context).size.width * (2 / 7),
        ),
      ),
    );
  }
}
