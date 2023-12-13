import 'package:code_demonstration/entities/company/company.dart';
import 'package:code_demonstration/features/business/company/company_service.dart';
import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';

class CompanyAppbarModel extends ElementaryModel {
  final CompanyService _companyService;

  StateNotifier<CompanyEntity?> get companyState =>
      _companyService.companyState;

  CompanyAppbarModel(
    ErrorHandler errorHandler,
    this._companyService,
  ) : super(errorHandler: errorHandler);
}
