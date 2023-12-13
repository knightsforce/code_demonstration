import 'package:code_demonstration/ui_kit/buttons/ink_button.dart';
import 'package:code_demonstration/ui_kit/loaders/primary_loader.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';

/// Базавая кнопка
class BaseButton extends StatefulWidget {
  /// Колбэк нажатия
  final VoidCallback? onPressed;

  /// Фоновый цвет
  final Color? backgroundColor;

  /// Фоновый цвет неактивной кнопки
  final Color? disabledBackgroundColor;

  /// Граница
  final BoxBorder? border;

  /// Неактивная граница
  final BoxBorder? disabledBorder;

  /// Текст заголовка
  final String titleText;

  /// Стиль заголовка
  final TextStyle? titleStyle;

  /// Стиль заголовка неактивной кнопки
  final TextStyle? disabledTitleStyle;

  /// Отображать ли состояние загрузки
  final bool isLoading;

  /// Состояние активна ли кнопка
  final StateNotifier<bool?>? activeState;

  /// Состояние отображать ли загрузу на кнопке
  /// Если передан [isLoading] - то используется он, иначе значение из [loadState]
  final StateNotifier<bool?>? loadState;

  /// Виджет загрузки
  final Widget? loader;

  /// Виджет отображающийся перед текстом
  final Widget? prefix;

  const BaseButton({
    required this.titleText,
    this.onPressed,
    this.backgroundColor,
    this.disabledBackgroundColor,
    this.border,
    this.disabledBorder,
    this.titleStyle,
    this.disabledTitleStyle,
    this.isLoading = false,
    this.activeState,
    this.loadState,
    this.loader,
    this.prefix,
    Key? key,
  });

  @override
  State<BaseButton> createState() => _BaseButtonState();
}

class _BaseButtonState extends State<BaseButton> {
  bool get _isActive =>
      widget.onPressed != null && (widget.activeState?.value ?? true);

  bool get _isLoading => widget.isLoading || (widget.loadState?.value ?? false);

  VoidCallback? get _onPressed => _isActive ? widget.onPressed : null;

  Color? get _color =>
      _isActive ? widget.backgroundColor : widget.disabledBackgroundColor;

  BoxBorder? get _border => _isActive ? widget.border : widget.disabledBorder;

  TextStyle? get _titleStyle =>
      _isActive ? widget.titleStyle : widget.disabledTitleStyle;

  @override
  void initState() {
    _subscribe();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant BaseButton oldWidget) {
    if (oldWidget.activeState != widget.activeState) {
      oldWidget.activeState?.removeListener(_activeListener);
      widget.activeState?.addListener(_activeListener);
    }

    if (oldWidget.loadState != widget.loadState) {
      oldWidget.loadState?.removeListener(_loadListener);
      widget.loadState?.addListener(_loadListener);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _unSubscribe();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkButton(
      onPressed: _onPressed,
      decoration: BoxDecoration(
        color: _color,
        border: _border,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 48),
        child: _isLoading
            ? Center(child: (widget.loader ?? const PrimaryLoader()))
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget.prefix ?? const SizedBox.shrink(),
                  Text(
                    widget.titleText,
                    style: _titleStyle,
                  ),
                  const SizedBox.shrink(),
                ],
              ),
      ),
    );
  }

  void _subscribe() {
    widget.activeState?.addListener(_activeListener);
    widget.loadState?.addListener(_loadListener);
  }

  void _unSubscribe() {
    widget.activeState?.removeListener(_activeListener);
    widget.loadState?.removeListener(_loadListener);
  }

  void _activeListener() {
    setState(() {});
  }

  void _loadListener() {
    setState(() {});
  }
}
