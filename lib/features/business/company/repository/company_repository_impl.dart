import 'package:code_demonstration/entities/company/company.dart';
import 'package:code_demonstration/features/business/company/repository/company_repository.dart';
import 'package:injectable/injectable.dart';

/// Реализация репозитория для работы с данными компании
@Singleton(as: CompanyRepository)
class CompanyRepositoryImpl implements CompanyRepository {
  /// Получить данные компании
  @override
  Future<CompanyEntity?> getCompany() async {
    return CompanyEntity(
      id: 0,
      name: 'Компания',
      description: 'Описание компании',
      logoUri:
          'https://azbuka-wp.ru/wp-content/uploads/2018/08/camomile-gratisography.jpg',
    );
  }
}
