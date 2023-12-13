import 'package:code_demonstration/core/message_controller/message_controller.dart';
import 'package:flutter/material.dart';

///Стандартная реализация [MessageController]
class MaterialMessageController implements MessageController {
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  void showError(String text) {
    _showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(
              Icons.error,
              color: Colors.redAccent,
            ),
            const SizedBox(width: 12),
            Text(text),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(SnackBar snackBar) {
    scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }
}
