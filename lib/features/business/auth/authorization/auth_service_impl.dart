import 'dart:async';

import 'package:code_demonstration/features/business/auth/authorization/auth_service.dart';
import 'package:code_demonstration/features/business/auth/authorization/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

/// Работает с авторизацией и разлогином
/// Отдает команды по токену
/// Меняет состояние сессии
@Singleton(as: AuthService)
class AuthInteractorImpl implements AuthService {
  final AuthRepository _authRepository;

  StreamSubscription? _sc;

  AuthInteractorImpl(
    this._authRepository,
  );

  @disposeMethod
  @override
  void dispose() {
    _sc?.cancel();
  }

  @override
  Future<void> initAuth() async {
    await _authRepository.initAuth();
  }

  @override
  Future<bool> signEmail({
    required String email,
  }) {
    return _authRepository.passwordLessWithEmail(email);
  }

  @override
  Future<bool> sendCode({
    required String email,
    required String code,
  }) async {
    return _authRepository.loginWithEmail(email, code);
  }

  @override
  Future<bool> loginWithUniversal() async {
    return _authRepository.loginWithUniversal();
  }

  @override
  Future<bool> checkIsLogged() {
    return _authRepository.checkIsLogged();
  }

  @override
  Future<String> getAccessToken() async {
    try {
      return await _authRepository.getAccessToken();
    } on Object catch (_) {
      return '';
    }
  }

  @override
  Future<void> logout() async {}
}
