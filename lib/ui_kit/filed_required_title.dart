import 'package:code_demonstration/localization/strings/common_strings.dart';
import 'package:code_demonstration/res/styles/text_styles.dart';
import 'package:flutter/material.dart';

/// Заголовок текстового поля с пометкой обязательности
class FiledRequiredTitle extends StatelessWidget {
  final String text;
  final bool isError;

  const FiledRequiredTitle(
    this.text, {
    Key? key,
    this.isError = false,
  }) : super(key: key);

  static Widget buildField(
    String? titleText, {
    bool isError = false,
  }) =>
      titleText == null
          ? const SizedBox.shrink()
          : FiledRequiredTitle(
              titleText,
              isError: isError,
            );

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: isError
            ? TextStyles.text400size15Error0
            : TextStyles.text400size15Primary,
        children: [
          const TextSpan(text: spaceString),
          TextSpan(
            text: starChar,
            style: TextStyles.text400size15Error0,
          ),
        ],
      ),
    );
  }
}
