abstract class AuthRepository {
  Future<void> initAuth();

  Future<bool> passwordLessWithEmail(String email);

  Future<bool> loginWithEmail(String email, String code);

  Future<bool> loginWithUniversal();

  Future<bool> checkIsLogged();

  Future<String> getAccessToken();

  Future<void> logout();
}
