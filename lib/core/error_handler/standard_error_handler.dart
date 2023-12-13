import 'package:code_demonstration/core/message_controller/message_controller.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';

/// Стандартная реализация ErrorHandler
class StandardErrorHandler implements ErrorHandler {
  final MessageController? _messageController;

  StandardErrorHandler([this._messageController]);

  @override
  void handleError(Object error, {StackTrace? stackTrace}) {
    debugPrint(error.toString());
    debugPrintStack(stackTrace: stackTrace);
    _messageController?.showError(error.toString());
  }
}
