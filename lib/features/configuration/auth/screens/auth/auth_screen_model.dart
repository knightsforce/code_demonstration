import 'package:code_demonstration/features/business/auth/authorization/auth_service.dart';
import 'package:elementary/elementary.dart';

class AuthScreenModel extends ElementaryModel {
  final AuthService _authService;

  AuthScreenModel(
    ErrorHandler errorHandler,
    this._authService,
  ) : super(errorHandler: errorHandler);

  Future<bool> sendEmail(String email) async {
    try {
      await _authService.signEmail(email: email);
      return true;
    } on Exception catch (e) {
      handleError(e);
      return false;
    }
  }
}
