abstract class LoginRepository {
  Future<bool> loginUser(String userName, String password);
}

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<bool> loginUser(String userName, String password) {
    return Future.delayed(const Duration(seconds: 2));
  }
}
