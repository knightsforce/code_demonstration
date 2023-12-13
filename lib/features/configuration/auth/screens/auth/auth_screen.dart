import 'package:code_demonstration/features/configuration/auth/widgets/company_header.dart';
import 'package:code_demonstration/localization/strings/common_strings.dart';
import 'package:code_demonstration/localization/strings/strings.dart';
import 'package:code_demonstration/res/color.dart';
import 'package:code_demonstration/res/styles/text_styles.dart';
import 'package:code_demonstration/ui_kit/buttons/app_bar_back_button.dart';
import 'package:code_demonstration/ui_kit/buttons/primary_button.dart';
import 'package:code_demonstration/ui_kit/text_fields/email_form_text_field.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'auth_screen_wm.dart';

/// Экран входа
class AuthScreen extends ElementaryWidget<IAuthScreenWidgetModel> {
  const AuthScreen({
    Key? key,
    WidgetModelFactory wmFactory = defaultAuthScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IAuthScreenWidgetModel wm) {
    return SizedBox(
      height: wm.windowHeight,
      child: Scaffold(
        backgroundColor: ColorPalette.surface,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: FormBuilder(
            key: wm.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 64),
                if (wm.isCanPop)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: AppBarBackButton(),
                    ),
                  ),
                const CompanyHeader(),
                const SizedBox(height: 60),
                Text(
                  Strings.signIn,
                  style: TextStyles.text800size32Primary,
                ),
                const SizedBox(height: 40),
                EmailFormTextField(
                  name: emptyString,
                  controller: wm.emailController,
                ),
                const SizedBox(height: 16),
                PrimaryButton(
                  titleText: Strings.signIn,
                  activeState: wm.btnState,
                  onPressed: wm.onNext,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
