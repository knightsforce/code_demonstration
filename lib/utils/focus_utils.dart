import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

/// Запросить фокус
void requestFocus(
  BuildContext context,
  FocusNode node,
) {
  /// Запрашиваю фокус и показываю клавиатуру
  /// Так как сворачивание клавиатуры не скроет фокус
  /// А вызов фокуса на сфокусированном поле не отобразит клавиатуру
  FocusScope.of(context).requestFocus(node);
  SystemChannels.textInput.invokeMethod('TextInput.show');
}

/// Сбросить фокус
void resetFocus([BuildContext? context]) {
  try {
    /// Если есть возможность снять фокус у текущего фокуса - снимаем
    if (FocusManager.instance.primaryFocus != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    } else if (context != null) {
      /// Иначе задаем новый фокус,
      /// Так как он ни к чему не привязан - эффект тот же
      /// Первый способ предпочтительнее
      requestFocus(
        context,
        FocusNode(),
      );
    }
  } on Object catch (e, trace) {
    debugPrint(e.toString());
    debugPrintStack(stackTrace: trace);
  }
}
