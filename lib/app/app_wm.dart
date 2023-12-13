import 'dart:async';
import 'package:code_demonstration/core/error_handler/error_handler_factory.dart';
import 'package:code_demonstration/features/configuration/auth/screens/auth/auth_screen_route.dart';
import 'package:code_demonstration/navigation/navigator_keys.dart';
import 'package:code_demonstration/ui_kit/mixins/navigation_wm_mixin.dart';
import 'package:flutter/material.dart';
import 'app_model.dart';
import 'app.dart';
import 'package:elementary/elementary.dart';

/// Метод создания AppWidgetModel
AppWidgetModel defaultAppWidgetModelFactory(_) {
  return AppWidgetModel(
    AppModel(createStandardErrorHandler()),
  );
}

/// Интерфейс WidgetModel для AppWidget
abstract class IAppWidgetModel implements IWidgetModel {
  GlobalKey<NavigatorState> get rootNavigatorKey;
}

/// WidgetModel для AppWidget
class AppWidgetModel extends WidgetModel<App, AppModel>
    with NavigationWmMixin
    implements IAppWidgetModel {
  @override
  GlobalKey<NavigatorState> get rootNavigatorKey =>
      NavigatorManager.instance.rootNavigatorKey;

  AppWidgetModel(
    AppModel model,
  ) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _init();
  }

  Future<void> _init() async {
    await model.initApp();
    rootNavigatorKey.currentState?.pushReplacement(AuthScreenMaterialRoute());
  }
}
