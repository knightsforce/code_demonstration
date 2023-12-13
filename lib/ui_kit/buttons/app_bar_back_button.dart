import 'package:flutter/material.dart';

/// Кнопка "назад"
class AppBarBackButton extends StatelessWidget {
  final Color? color;
  final EdgeInsets margin;
  final VoidCallback? onPress;
  final double size;
  final EdgeInsets padding;

  AppBarBackButton({
    Key? key,
    double? size,
    this.color,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.onPress,
  })  : size = size ?? 24,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);

    if (!navigator.canPop()) {
      return SizedBox(width: size, height: size);
    }

    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: GestureDetector(
        onTap: onPress ?? () => navigator.pop(),
        child: Padding(
          padding: padding ?? EdgeInsets.zero,
          child: SizedBox(
            width: size,
            height: size,
            child: const Icon(Icons.arrow_back),
          ),
        ),
      ),
    );
  }
}
