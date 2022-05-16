import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shop_client/pages/login/domain/login_usecase.dart';

part 'login_viewmodel.g.dart';

class LoginViewModel = _LoginViewModel with _$LoginViewModel;

abstract class _LoginViewModel with Store implements Disposable {
  final LoginUseCase _loginUseCase;

  _LoginViewModel(this._loginUseCase);

  String _userName = "";
  String _password = "";

  @observable
  bool isLoginValid = false;

  @observable
  bool isLoading = true;

  @action
  _validateLogin() {
    isLoginValid = _userName.isNotEmpty && _password.isNotEmpty;
  }

  updateUserName(String userName) {
    _userName = userName;
    _validateLogin();
  }

  updatePassword(String password) {
    _password = password;
    _validateLogin();
  }

  @action
  loginUser() async {
    isLoading = true;
    await _loginUseCase.execute(_userName, _password);
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
