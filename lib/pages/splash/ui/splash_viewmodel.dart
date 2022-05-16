import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';

class SplashViewModel extends Disposable {
  late Timer timer;

  startCountDown() async {
    timer = Timer(const Duration(seconds: 2), () {
      _goToLoginPage();
    });
  }

  _goToLoginPage() {
    Modular.to.navigate('/login');
  }

  @override
  void dispose() {
    timer.cancel();
  }
}
