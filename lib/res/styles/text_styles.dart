import 'package:code_demonstration/res/color.dart';
import 'package:flutter/material.dart';

abstract class TextStyles {
  static const baseTextStyle = TextStyle();

  /// 400

  static final text400size14Primary = text400.copyWith(
    fontSize: 14,
    color: ColorPalette.primary,
  );

  static final text400size15Primary = text400.copyWith(
    fontSize: 15,
    color: ColorPalette.primary,
  );

  static final text400 = baseTextStyle.copyWith(
    fontWeight: FontWeight.w400,
  );

  static final text400size13Primary = text400.copyWith(
    fontSize: 13,
    color: ColorPalette.primary,
  );

  static final text400size15Error0 = text400.copyWith(
    fontSize: 15,
    color: ColorPalette.error0,
  );

  /// 600

  static final text600 = baseTextStyle.copyWith(
    fontWeight: FontWeight.w600,
  );

  static final text600size15Surface = text600.copyWith(
    fontSize: 15,
    color: ColorPalette.surface,
  );

  static final text600size15Primary = text600.copyWith(
    fontSize: 15,
    color: ColorPalette.primary,
  );

  /// 800

  static final text800 = baseTextStyle.copyWith(
    fontWeight: FontWeight.w800,
  );

  static final text800size15Primary = text800.copyWith(
    fontSize: 15,
    color: ColorPalette.primary,
  );

  static final text800size32Primary = text800.copyWith(
    fontSize: 32,
    color: ColorPalette.primary,
  );
}
