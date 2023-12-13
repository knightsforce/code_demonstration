import 'package:code_demonstration/ui_kit/buttons/app_bar_back_button.dart';
import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  final EdgeInsetsGeometry? padding;

  const AuthHeader({
    Key? key,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isCanPop = Navigator.of(context).canPop();

    return Align(
      alignment: Alignment.centerLeft,
      child: Opacity(
        opacity: isCanPop ? 1 : 0,
        child: IgnorePointer(
          ignoring: !isCanPop,
          child: Padding(
            padding: padding ??
                const EdgeInsets.only(
                  top: 57,
                  bottom: 27,
                  left: 16,
                ),
            child: AppBarBackButton(),
          ),
        ),
      ),
    );
  }
}
