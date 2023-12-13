import 'package:code_demonstration/core/error_handler/error_handler_factory.dart';
import 'package:code_demonstration/di/di_container.dart';
import 'package:code_demonstration/features/business/auth/authorization/auth_service.dart';
import 'package:code_demonstration/ui_kit/mixins/form_builder_mixin_wm.dart';
import 'package:code_demonstration/ui_kit/mixins/navigation_wm_mixin.dart';
import 'package:code_demonstration/utils/focus_utils.dart';
import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'auth_screen_model.dart';
import 'auth_screen.dart';

abstract class IAuthScreenWidgetModel implements IWidgetModel {
  abstract final GlobalKey<FormBuilderState> formKey;

  abstract final TextEditingController emailController;
  abstract final StateNotifier<bool> btnState;
  abstract final StateNotifier<bool> loadState;

  double get windowHeight;

  bool get isCanPop;

  void onNext();
}

AuthScreenWidgetModel defaultAuthScreenWidgetModelFactory(_) {
  return AuthScreenWidgetModel(
    AuthScreenModel(
      createStandardErrorHandler(),
      getIt.get<AuthService>(),
    ),
  );
}

class AuthScreenWidgetModel extends WidgetModel<AuthScreen, AuthScreenModel>
    with NavigationWmMixin, FormBuilderMixinWM
    implements IAuthScreenWidgetModel {
  @override
  late final emailController = TextEditingController();

  @override
  late final loadState = StateNotifier<bool>(initValue: false);

  @override
  late final btnState = StateNotifier<bool>(initValue: _emailText.isNotEmpty);

  @override
  double get windowHeight => MediaQuery.of(context).size.height;

  @override
  bool get isCanPop => navigator.canPop();

  String get _emailText => emailController.text;

  AuthScreenWidgetModel(AuthScreenModel model) : super(model);

  @override
  void initWidgetModel() {
    emailController.addListener(_handleEmail);
    super.initWidgetModel();
  }

  @override
  void dispose() {
    emailController.dispose();
    loadState.dispose();
    super.dispose();
  }

  @override
  Future<void> handleValidForm() async {
    resetFocus();

    loadState.accept(true);
    final isSuccess = await model.sendEmail(_emailText);

    if (isSuccess) {
      /// TODO успех
    }

    loadState.accept(false);
  }

  void _handleEmail() {
    btnState.accept(_emailText.isNotEmpty);
  }
}
