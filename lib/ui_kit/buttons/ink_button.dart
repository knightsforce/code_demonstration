import 'package:flutter/material.dart';

/// Кнопка построенная на [InkWell]
/// Позволяет использовать [InkWell] с [BoxDecoration]
class InkButton extends StatelessWidget {
  /// Колбэк нажатия
  final VoidCallback? onPressed;

  /// Ширина
  final double? width;

  /// Высота
  final double? height;

  /// Внешний отступ
  final EdgeInsets? margin;

  /// Внутренний отступ
  final EdgeInsets? padding;

  /// Декорация
  final BoxDecoration? decoration;

  /// Ограничения
  final BoxConstraints? constraints;

  /// Дочерний виджет
  final Widget child;

  const InkButton({
    Key? key,
    this.onPressed,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.decoration,
    this.constraints,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: decoration == null ? Clip.none : Clip.hardEdge,
      width: width,
      height: height,
      margin: margin,
      decoration: decoration,
      constraints: constraints,
      child: Material(
        type: MaterialType.transparency,
        child: _PressContainer(
          onPress: onPressed,
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}

class _PressContainer extends StatelessWidget {
  final VoidCallback? onPress;
  final EdgeInsets? padding;
  final Widget child;

  const _PressContainer({
    Key? key,
    this.onPress,
    this.padding,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: child,
      ),
    );
  }
}
