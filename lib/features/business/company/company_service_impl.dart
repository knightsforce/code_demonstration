import 'package:code_demonstration/entities/company/company.dart';
import 'package:code_demonstration/features/business/company/company_service.dart';
import 'package:code_demonstration/features/business/company/repository/company_repository.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:injectable/injectable.dart';

/// Реализация интерактора для работы с данными компании
@Singleton(as: CompanyService)
class CompanyServiceImpl implements CompanyService {
  final CompanyRepository _companyRepository;

  /// State с данными компании
  @override
  final companyState = StateNotifier<CompanyEntity?>();

  @override
  CompanyEntity? get company => companyState.value;

  CompanyServiceImpl(
    this._companyRepository,
  );

  @override
  @disposeMethod
  void dispose() {
    companyState.dispose();
  }

  /// Получить данные компании и поместить в Notifier [companyState]
  @override
  Future<void> fetchCompany() async {
    final company = await _getCompany();
    companyState.accept(company);
  }

  Future<CompanyEntity?> _getCompany() => _companyRepository.getCompany();
}
