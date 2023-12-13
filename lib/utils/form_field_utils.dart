import 'package:flutter/widgets.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

FormFieldValidator<T>? createValidator<T>({
  FormFieldValidator<T>? validator,
  required bool isRequired,
  required ValueChanged<bool> onValidate,
}) {
  if (validator == null && !isRequired) {
    return null;
  }

  return (T? value) {
    final isSuccessRequired = isRequired
        ? FormBuilderValidators.required(errorText: '')(value) == null
        : true;

    final isSuccess = validator?.call(value) == null && isSuccessRequired;

    Future(() => onValidate(isSuccess));

    return isSuccess ? null : '';
  };
}
