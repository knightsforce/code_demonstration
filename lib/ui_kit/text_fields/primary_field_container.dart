import 'package:code_demonstration/res/styles/constraints.dart';
import 'package:code_demonstration/res/styles/text_styles.dart';
import 'package:code_demonstration/ui_kit/types/title_builder.dart';
import 'package:flutter/material.dart';

/// Контейнер с UI [PrimaryFormTextField]
class PrimaryFormTextFieldContainer extends StatelessWidget {
  final Widget? child;
  final Widget? title;
  final String? titleText;
  final TitleBuilder? titleBuilder;
  final bool isError;
  final BoxConstraints constraints;

  PrimaryFormTextFieldContainer({
    Key? key,
    this.child,
    this.title,
    this.titleText,
    this.titleBuilder,
    this.isError = false,
    BoxConstraints? constraints,
  })  : constraints = constraints ?? ConstraintsStyles.textFieldBoxConstraints,
        assert(title == null || titleText == null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Title(
          title: title,
          titleText: titleText,
          titleBuilder: titleBuilder,
          isError: isError,
        ),
        ConstrainedBox(
          constraints: constraints,
          child: child,
        ),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  final Widget? title;
  final String? titleText;
  final TitleBuilder? titleBuilder;
  final bool isError;

  final _padding = const EdgeInsets.only(bottom: 5);

  const _Title({
    Key? key,
    this.title,
    this.titleText,
    this.titleBuilder,
    this.isError = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (title != null) {
      return Padding(
        padding: _padding,
        child: title!,
      );
    } else if (titleBuilder != null) {
      return Padding(
        padding: _padding,
        child: titleBuilder!(titleText, isError: isError),
      );
    } else if (titleText != null) {
      return Padding(
        padding: _padding,
        child: Text(
          titleText!,
          style: isError
              ? TextStyles.text400size15Error0
              : TextStyles.text400size15Primary,
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
