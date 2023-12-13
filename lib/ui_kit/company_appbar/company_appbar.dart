import 'package:code_demonstration/entities/company/company.dart';
import 'package:code_demonstration/res/styles/text_styles.dart';
import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';

import 'company_appbar_wm.dart';

/// AppBar с информацией о компании
class CompanyAppbar extends ElementaryWidget<ICompanyAppbarWidgetModel>
    implements PreferredSizeWidget {
  final double logoSize;
  final EdgeInsetsGeometry logoMargin;
  final EdgeInsets descriptionPadding;
  final TextStyle nameStyle;
  final TextStyle descriptionStyle;
  final bool _isPhone;

  final Size _size;

  @override
  Size get preferredSize => _size;

  CompanyAppbar({
    Key? key,
    double? logoSize,
    double? height,
    EdgeInsetsGeometry? logoMargin,
    EdgeInsets? descriptionPadding,
    required this.nameStyle,
    TextStyle? descriptionStyle,
    WidgetModelFactory wmFactory = defaultCompanyAppbarWidgetModelFactory,
  })  : _isPhone = true,
        logoSize = logoSize ?? 80,
        _size = Size(double.infinity, height ?? 80),
        logoMargin = logoMargin ?? const EdgeInsets.only(right: 12),
        descriptionPadding = descriptionPadding ?? EdgeInsets.only(top: 4),
        descriptionStyle =
            descriptionStyle ?? TextStyles.text400size14Primary,
        super(wmFactory, key: key);

  CompanyAppbar.desktop({
    Key? key,
    double? logoSize,
    double? height,
    EdgeInsetsGeometry? logoMargin,
    EdgeInsets? descriptionPadding,
    required this.nameStyle,
    TextStyle? descriptionStyle,
    WidgetModelFactory wmFactory = defaultCompanyAppbarWidgetModelFactory,
  })  : _isPhone = false,
        logoSize = logoSize ?? 80,
        _size = Size(double.infinity, height ?? 80),
        logoMargin = logoMargin ?? const EdgeInsets.only(right: 20),
        descriptionPadding =
            descriptionPadding ?? const EdgeInsets.only(top: 4),
        descriptionStyle =
            descriptionStyle ?? TextStyles.text400size14Primary,
        super(wmFactory, key: key);

  @override
  Widget build(ICompanyAppbarWidgetModel wm) {
    return StateNotifierBuilder<CompanyEntity?>(
      listenableState: wm.companyState,
      builder: (BuildContext context, CompanyEntity? company) {
        if (company == null) {
          return SizedBox(
            width: _size.width,
            height: _size.height,
          );
        }

        return SizedBox(
          width: _isPhone ? _size.width : null,
          height: _size.height,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (company.logoUri != null)
                Padding(
                  padding: logoMargin,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      company.logoUri!,
                      width: logoSize,
                      height: logoSize,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              Flexible(
                child: _Description(
                  company: company,
                  nameStyle: nameStyle,
                  descriptionPadding: descriptionPadding,
                  descriptionStyle: descriptionStyle,
                  isPhone: _isPhone,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Description extends StatelessWidget {
  final CompanyEntity company;
  final TextStyle nameStyle;
  final EdgeInsets descriptionPadding;
  final TextStyle descriptionStyle;
  final bool isPhone;

  const _Description({
    Key? key,
    required this.company,
    required this.descriptionPadding,
    required this.descriptionStyle,
    required this.nameStyle,
    required this.isPhone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isPhone) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (company.name.isNotEmpty)
            Text(
              company.name,
              style: nameStyle,
            ),
          if (company.description.isNotEmpty)
            Padding(
              padding: descriptionPadding,
              child: Text(
                company.description,
                style: descriptionStyle,
              ),
            ),
        ],
      );
    }

    return Text(
      company.name,
      style: nameStyle,
    );
  }
}
