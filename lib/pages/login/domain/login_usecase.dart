import 'package:shop_client/pages/login/data/login_repository.dart';

abstract class LoginUseCase {
  Future<bool> execute(String userName, String password);
}

class LoginUseCaseImpl implements LoginUseCase {
  final LoginRepository _loginRepository;

  LoginUseCaseImpl(this._loginRepository);

  @override
  Future<bool> execute(String userName, String password) {
    return _loginRepository.loginUser(userName, password);
  }
}
