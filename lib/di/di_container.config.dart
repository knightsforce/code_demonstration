// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:code_demonstration/features/business/auth/authorization/auth_service.dart'
    as _i5;
import 'package:code_demonstration/features/business/auth/authorization/auth_service_impl.dart'
    as _i6;
import 'package:code_demonstration/features/business/auth/authorization/repository/auth_repository.dart'
    as _i3;
import 'package:code_demonstration/features/business/auth/authorization/repository/auth_repository_impl.dart'
    as _i4;
import 'package:code_demonstration/features/business/company/company_service.dart'
    as _i9;
import 'package:code_demonstration/features/business/company/company_service_impl.dart'
    as _i10;
import 'package:code_demonstration/features/business/company/repository/company_repository.dart'
    as _i7;
import 'package:code_demonstration/features/business/company/repository/company_repository_impl.dart'
    as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt initMainGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.AuthRepository>(_i4.AuthRepositoryImpl());
  gh.singleton<_i5.AuthService>(
    _i6.AuthInteractorImpl(gh<_i3.AuthRepository>()),
    dispose: (i) => i.dispose(),
  );
  gh.singleton<_i7.CompanyRepository>(_i8.CompanyRepositoryImpl());
  gh.singleton<_i9.CompanyService>(
    _i10.CompanyServiceImpl(gh<_i7.CompanyRepository>()),
    dispose: (i) => i.dispose(),
  );
  return getIt;
}
