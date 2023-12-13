import 'package:code_demonstration/res/color.dart';
import 'package:code_demonstration/res/styles/text_styles.dart';
import 'package:code_demonstration/ui_kit/buttons/button_base.dart';
import 'package:code_demonstration/ui_kit/loaders/primary_loader.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';

/// Основная (Оранжевая) кнопка кнопка
class PrimaryButton extends StatelessWidget {
  /// См. [BaseButton.titleText]
  final String titleText;

  /// См. [BaseButton.loadState]
  final TextStyle? titleStyle;

  /// См. [BaseButton.loadState]
  final TextStyle? disabledTitleStyle;

  /// См. [BaseButton.onPressed]
  final VoidCallback? onPressed;

  /// См. [BaseButton.isLoading]
  final bool isLoading;

  /// См. [BaseButton.activeState]
  final StateNotifier<bool?>? activeState;

  /// См. [BaseButton.loadState]
  final StateNotifier<bool?>? loadState;

  final PrimaryButtonType type;

  const PrimaryButton({
    required this.titleText,
    this.titleStyle,
    this.disabledTitleStyle,
    this.onPressed,
    this.isLoading = false,
    this.activeState,
    this.loadState,
    this.type = PrimaryButtonType.primary,
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      onPressed: onPressed,
      titleText: titleText,
      titleStyle: TextStyles.text600size15Surface,
      disabledTitleStyle: _getDisabledTitleStyle(context),
      backgroundColor: _getBackgroundColor(context),
      disabledBackgroundColor: _getDisabledBackgroundColor(context),
      isLoading: isLoading,
      activeState: activeState,
      loadState: loadState,
      loader: const PrimaryLoader(),
    );
  }

  TextStyle? _getDisabledTitleStyle(BuildContext context) =>
      disabledTitleStyle ??
      TextStyles.text600size15Surface.copyWith(
        color: ColorPalette.surface.withOpacity(.8),
      );

  Color? _getBackgroundColor(BuildContext context) {
    return switch (type) {
      PrimaryButtonType.primary => ColorPalette.accent,
      PrimaryButtonType.secondary => ColorPalette.primary,
    };
  }

  Color? _getDisabledBackgroundColor(BuildContext context) {
    return switch (type) {
      PrimaryButtonType.primary => ColorPalette.accent.withOpacity(.8),
      PrimaryButtonType.secondary => ColorPalette.primary.withOpacity(.8),
    };
  }
}

enum PrimaryButtonType {
  /// Зеленая
  primary,

  /// Черная
  secondary,
}
