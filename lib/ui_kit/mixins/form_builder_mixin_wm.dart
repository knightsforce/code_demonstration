import 'package:elementary/elementary.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

typedef _FieldsCollectionValue
    = FormBuilderFieldState<FormBuilderField<dynamic>, dynamic>;

typedef _FieldsCollection = Map<String, _FieldsCollectionValue>;

/// Миксин для рабльы с формой
mixin FormBuilderMixinWM<W extends ElementaryWidget, M extends ElementaryModel>
    on WidgetModel<W, M> {
  /// Ключ формы
  final formKey = GlobalKey<FormBuilderState>();

  @protected
  FormBuilderState? get formCurrentState => formKey.currentState;

  _FieldsCollection? get _fields => formCurrentState?.fields;

  /// Получить значение поля
  T? getFieldValue<T>(Object name, [T? defaultValue]) {
    return _fields?[name.toString()]?.value ?? defaultValue;
  }

  T getFieldValueSafe<T>(Object name, T defaultValue) {
    return getFieldValue<T>(name) ?? defaultValue;
  }

  /// Получить строковое значение поля
  String? getFieldValueString(Object name, [String? defaultValue]) {
    return getFieldValue(name)?.toString() ?? defaultValue;
  }

  /// Задать значение поля
  void setFieldValue<T>(Object name, T? value) {
    _fields?[name.toString()]?.setValue(value);
  }

  /// Метод вызывающийся если форма валидна
  @protected
  Future<void> handleValidForm();

  /// Методы вызывающий
  @protected
  Future<void> handleForm() async {
    final isValid = _validate();
    if (!isValid) {
      return;
    }

    await handleValidForm();
  }

  /// Метод вызывающийся для продолжения флоу
  /// Например, нажатие на кнопку
  void onNext() => handleForm();

  bool _validate() => formCurrentState?.validate() ?? false;
}
