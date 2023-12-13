import 'package:code_demonstration/entities/company/company.dart';

/// Репозиторий для работы с данными компании
abstract class CompanyRepository {
  /// Получить данные компании
  Future<CompanyEntity?> getCompany();
}
