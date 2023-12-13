import 'package:code_demonstration/res/styles/text_styles.dart';
import 'package:code_demonstration/ui_kit/company_appbar/company_appbar.dart';
import 'package:flutter/material.dart';

/// Header с организацией
class CompanyHeader extends StatelessWidget {
  const CompanyHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CompanyAppbar(
      height: 60,
      logoSize: 60,
      nameStyle: TextStyles.text800size15Primary,
      descriptionStyle: TextStyles.text400size13Primary,
      descriptionPadding: const EdgeInsets.only(top: 6),
    );
  }
}
