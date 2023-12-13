abstract class AuthService {
  void dispose();

  Future<void> initAuth();

  Future<void> signEmail({
    required String email,
  });

  Future<bool> sendCode({
    required String email,
    required String code,
  });

  Future<bool> loginWithUniversal();

  Future<bool> checkIsLogged();

  Future<String> getAccessToken();

  Future<void> logout();
}
