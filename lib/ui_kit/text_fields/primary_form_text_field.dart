import 'package:code_demonstration/extensions/object_extension.dart';
import 'package:code_demonstration/localization/strings/common_strings.dart';
import 'package:code_demonstration/res/color.dart';
import 'package:code_demonstration/res/styles/input_decorations.dart';
import 'package:code_demonstration/res/styles/text_styles.dart';
import 'package:code_demonstration/ui_kit/text_fields/custom_form_builder_text_field.dart';
import 'package:code_demonstration/ui_kit/text_fields/primary_field_container.dart';
import 'package:code_demonstration/ui_kit/types/title_builder.dart';
import 'package:code_demonstration/utils/form_field_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Основное тектсовое поле
class PrimaryFormTextField extends StatefulWidget {
  final Object name;
  final Object? initialValue;
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final Widget? title;
  final String? titleText;
  final TitleBuilder? titleBuilder;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool isEnable;
  final bool isMultiline;
  final Color? backgroundColor;
  final Color? disableBackgroundColor;
  final InputBorder? border;
  final bool isRequired;
  final int? maxLength;
  final BoxConstraints? constraints;
  final VoidCallback? onPress;
  final int? minLines;
  final int? maxLines;

  const PrimaryFormTextField({
    Key? key,
    required this.name,
    this.initialValue,
    this.hintText = emptyString,
    this.inputFormatters,
    this.validator,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.title,
    this.titleText,
    this.titleBuilder,
    this.suffixIcon,
    this.obscureText = false,
    this.isEnable = true,
    this.isMultiline = false,
    this.backgroundColor,
    this.disableBackgroundColor,
    this.border,
    this.isRequired = false,
    this.maxLength,
    this.constraints,
    this.onPress,
    int? minLines,
    int? maxLines,
  })  : minLines = minLines ?? 1,
        maxLines = maxLines ?? minLines ?? 1,
        super(key: key);

  @override
  State<PrimaryFormTextField> createState() => _PrimaryFormTextFieldState();
}

class _PrimaryFormTextFieldState extends State<PrimaryFormTextField> {
  late final _validator = widget.validator;
  late final _isRequired = widget.isRequired;
  late final _isEnable = widget.isEnable;

  bool _isError = false;

  TextStyle get _textStyle {
    if (_isError) {
      return TextStyles.text400size15Error0;
    } else if (_isEnable) {
      return TextStyles.text400size15Primary;
    }

    return TextStyles.text400size15Primary;
  }

  Color get _fillColor {
    if (_isError) {
      return ColorPalette.error1;
    } else if (_isEnable) {
      return widget.backgroundColor ?? ColorPalette.surface;
    }

    return ColorPalette.surface;
  }

  OutlineInputBorder get _border {
    if (_isError) {
      return OutlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: ColorPalette.error1,
        ),
        borderRadius: BorderRadius.circular(16),
      );
    }

    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: ColorPalette.primary,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(16),
    );
  }

  TextInputType? get _keyboardType {
    if (widget.keyboardType != null) {
      return widget.keyboardType;
    } else if (widget.isMultiline) {
      return TextInputType.multiline;
    }

    return TextInputType.text;
  }

  int? get _minLines {
    if (widget.minLines != null) {
      return widget.minLines;
    }
    if (widget.isMultiline) {
      return null;
    }

    return 1;
  }

  int? get _maxLines {
    if (widget.maxLines != null) {
      return widget.maxLines;
    }
    if (widget.isMultiline) {
      return null;
    }

    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryFormTextFieldContainer(
      title: widget.title,
      titleText: widget.titleText,
      titleBuilder: widget.titleBuilder,
      constraints: widget.constraints,
      isError: _isError,
      child: IgnorePointer(
        ignoring: !_isEnable,
        child: CustomFormBuilderTextField(
          name: widget.name,
          style: _textStyle,
          initialValue: widget.initialValue?.str,
          validator: _getValidator(),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          inputFormatters: widget.inputFormatters,
          onTap: widget.onPress,
          decoration: InputDecorations.textFieldDecoration(
            widget.hintText,
            hintStyle: _isError
                ? TextStyles.text400size15Error0
                : TextStyles.text400size15Primary,
            suffixIcon: widget.suffixIcon == null
                ? null
                : Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Align(
                      widthFactor: 1.0,
                      heightFactor: 1.0,
                      child: widget.suffixIcon,
                    ),
                  ),
            isEnable: _isEnable,
            fillColor: _fillColor,
            backgroundColor: widget.backgroundColor ?? ColorPalette.surface,
            disableBackgroundColor: ColorPalette.surface,
            border: _border,
          ),
          controller: widget.controller,
          focusNode: widget.focusNode,
          keyboardType: _keyboardType,
          obscureText: widget.obscureText,
          cursorColor: ColorPalette.primary,
          maxLength: widget.maxLength,
          minLines: _minLines,
          maxLines: _maxLines,
        ),
      ),
    );
  }

  FormFieldValidator<String>? _getValidator() {
    return createValidator<String>(
      validator: _validator,
      isRequired: _isRequired,
      onValidate: _updateError,
    );
  }

  void _updateError(bool isSuccess) {
    if (_isError == !isSuccess) {
      return;
    }

    Future(() {
      setState(() {
        _isError = !isSuccess;
      });
    });
  }
}
