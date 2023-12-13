import 'package:code_demonstration/localization/strings/common_strings.dart';
import 'package:code_demonstration/localization/strings/strings.dart';
import 'package:code_demonstration/ui_kit/filed_required_title.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'primary_form_text_field.dart';

/// Поле Email
class EmailFormTextField extends PrimaryFormTextField {
  EmailFormTextField({
    super.key,
    required super.name,
    super.initialValue,
    super.controller,
    super.focusNode,
    super.isEnable = true,
    super.isRequired = false,
    super.maxLength,
  }) : super(
          hintText: emailHint,
          titleText: Strings.email,
          titleBuilder: isRequired ? FiledRequiredTitle.buildField : null,
          validator: FormBuilderValidators.email(),
        );
}
