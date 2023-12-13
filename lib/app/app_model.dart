import 'package:elementary/elementary.dart';

/// Model главного виджета приложения
class AppModel extends ElementaryModel {
  AppModel(
    ErrorHandler errorHandler,
  ) : super(errorHandler: errorHandler);

  Future<void> initApp() async {
    try {
      return await Future.delayed(const Duration(seconds: 1));
    } on Object catch (e, s) {
      handleError(e, stackTrace: s);
    }
  }
}
