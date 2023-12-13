import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'di_container.config.dart';

/// Экземпляр GetIt основного пакета приложения
final getIt = GetIt.asNewInstance();

/// Инициализация DI
///
/// Данная функция передает зависимости во внутренние пакеты
@InjectableInit(
  asExtension: false,
  initializerName: 'initMainGetIt',
)
Future<void> initDi() async {
  initMainGetIt(
    getIt,
  );
}
