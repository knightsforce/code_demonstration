import 'package:code_demonstration/core/error_handler/error_handler_factory.dart';
import 'package:code_demonstration/di/di_container.dart';
import 'package:code_demonstration/entities/company/company.dart';
import 'package:code_demonstration/features/business/company/company_service.dart';
import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'company_appbar_model.dart';
import 'company_appbar.dart';

abstract class ICompanyAppbarWidgetModel implements IWidgetModel {
  StateNotifier<CompanyEntity?> get companyState;
}

CompanyAppbarWidgetModel defaultCompanyAppbarWidgetModelFactory(
  BuildContext context,
) {
  return CompanyAppbarWidgetModel(
    CompanyAppbarModel(
      createStandardErrorHandler(),
      getIt.get<CompanyService>(),
    ),
  );
}

class CompanyAppbarWidgetModel
    extends WidgetModel<CompanyAppbar, CompanyAppbarModel>
    implements ICompanyAppbarWidgetModel {
  @override
  StateNotifier<CompanyEntity?> get companyState => model.companyState;

  CompanyAppbarWidgetModel(CompanyAppbarModel model) : super(model);
}
