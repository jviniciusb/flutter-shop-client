import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shop_client/res/colors.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Shop client',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        scaffoldBackgroundColor: ColorsRes.backgroundColor,
        primarySwatch: Colors.blue,
        fontFamily: "Gordita",
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: ColorsRes.textColor),
          bodyText2: TextStyle(color: ColorsRes.textColor),
        ),
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    ); //added by extension
  }
}
