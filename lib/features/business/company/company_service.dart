import 'package:code_demonstration/entities/company/company.dart';
import 'package:elementary_helper/elementary_helper.dart';

/// Интерактор для работы с данными компании
abstract class CompanyService {
  /// State с данными компании
  abstract final StateNotifier<CompanyEntity?> companyState;

  /// Данные компании
  CompanyEntity? get company;

  void dispose();

  /// Получить данные компании и сохранить куда-либо в интеракторе
  Future<void> fetchCompany();
}
