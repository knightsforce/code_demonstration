import 'package:code_demonstration/core/error_handler/standard_error_handler.dart';
import 'package:code_demonstration/core/message_controller/material_message_controller.dart';
import 'package:code_demonstration/core/message_controller/message_controller.dart';

StandardErrorHandler createStandardErrorHandler([
  MessageController? materialMessageController,
]) {
  return StandardErrorHandler(
    materialMessageController ?? MaterialMessageController(),
  );
}
