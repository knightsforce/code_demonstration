import 'package:code_demonstration/localization/strings/common_strings.dart';
import 'package:code_demonstration/res/styles/text_styles.dart';
import 'package:flutter/material.dart';

abstract class InputDecorations {
  /// Декорация для текстового поля
  static InputDecoration textFieldDecoration(
    String? hintText, {
    TextStyle? hintStyle,
    Widget? suffixIcon,
    BoxConstraints? suffixIconConstraints,
    String? prefixText,
    bool isEnable = true,
    Color? fillColor,
    Color? backgroundColor,
    Color? disableBackgroundColor,
    InputBorder? border,
  }) {
    backgroundColor ??= Colors.transparent;
    disableBackgroundColor ??= Colors.transparent;
    fillColor ??= isEnable ? backgroundColor : disableBackgroundColor;

    return InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      hintText: hintText,
      border: border,
      focusedBorder: border,
      enabledBorder: border,
      disabledBorder: border,
      errorBorder: border,
      focusedErrorBorder: border,
      contentPadding: const EdgeInsets.symmetric(
        vertical: 15.5,
        horizontal: 20,
      ),
      hintStyle: hintStyle ?? TextStyles.text400size15Primary,
      suffixIcon: suffixIcon,
      suffixIconConstraints: suffixIconConstraints,
      counterText: emptyString,
      enabled: isEnable,
      filled: true,
      fillColor: fillColor,
      errorStyle: const TextStyle(height: 0),
    );
  }
}
