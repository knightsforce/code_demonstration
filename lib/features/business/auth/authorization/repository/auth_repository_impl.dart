import 'package:code_demonstration/features/business/auth/authorization/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<void> initAuth() async {}

  @override
  Future<bool> loginWithUniversal() async {
    return true;
  }

  @override
  Future<bool> passwordLessWithEmail(String email) async {
    return true;
  }

  @override
  Future<bool> loginWithEmail(String email, String code) async {
    return true;
  }

  @override
  Future<bool> checkIsLogged() async {
    return false;
  }

  @override
  Future<String> getAccessToken() async {
    return '';
  }

  @override
  Future<void> logout() async {
    return;
  }
}
