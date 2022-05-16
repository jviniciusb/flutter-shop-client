import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_client/pages/login/ui/login_viewmodel.dart';
import 'package:shop_client/res/assets.dart';
import 'package:shop_client/res/colors.dart';
import 'package:shop_client/res/dimens.dart';
import 'package:shop_client/res/strings.dart';

class LoginPage extends StatelessWidget {
  final LoginViewModel _loginViewModel = Modular.get<LoginViewModel>();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        padding: const EdgeInsets.all(DimensRes.defaultSpace),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: DimensRes.defaultSpace),
                  child: SvgPicture.asset(
                    AssetsRes.bagIcon,
                    width: MediaQuery.of(context).size.width * (2 / 7),
                  ),
                ),
                TextField(
                  onChanged: (value) {
                    _loginViewModel.updateUserName(value);
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: StringsRes.userNameLabel,
                    hintText: StringsRes.userNameHint,
                  ),
                ),
                const SizedBox(
                  height: DimensRes.defaultSpace,
                ),
                TextField(
                  obscureText: true,
                  onChanged: (value) {
                    _loginViewModel.updatePassword(value);
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: StringsRes.passwordLabel,
                  ),
                ),
                const SizedBox(
                  height: DimensRes.defaultSpace,
                ),
                Observer(builder: (_) {
                  bool isButtonEnabled = _loginViewModel.isLoginValid;
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isButtonEnabled
                          ? () {
                              Modular.to.navigate('/home');
                            }
                          : null,
                      child: const Text(
                        StringsRes.loginLabel,
                        style: TextStyle(
                          fontSize: DimensRes.defaultText,
                          color: ColorsRes.secondaryTextColor,
                        ),
                      ),
                    ),
                  );
                }),
                const SizedBox(
                  height: DimensRes.bigSpace,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin:
                            const EdgeInsets.only(right: DimensRes.xsmallSpace),
                        height: DimensRes.smallBorder,
                        color: ColorsRes.textColor,
                      ),
                    ),
                    const Text(
                      'Ou',
                      style: TextStyle(
                        fontSize: DimensRes.defaultText,
                        color: Colors.blue,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin:
                            const EdgeInsets.only(left: DimensRes.xsmallSpace),
                        height: DimensRes.smallBorder,
                        color: ColorsRes.textColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: DimensRes.xsmallSpace,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    SvgPicture.asset(AssetsRes.googleIcon),
                    SvgPicture.asset(AssetsRes.facebookIcon),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
