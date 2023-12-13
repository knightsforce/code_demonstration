import 'package:code_demonstration/app/widgets/splash.dart';
import 'package:code_demonstration/core/message_controller/material_message_controller.dart';
import 'package:code_demonstration/navigation/navigator_keys.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import 'app_wm.dart';

/// Главный виджет приложения
class App extends ElementaryWidget<IAppWidgetModel> {
  const App({
    Key? key,
    WidgetModelFactory wmFactory = defaultAppWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IAppWidgetModel wm) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: MaterialMessageController.scaffoldMessengerKey,
      navigatorKey: wm.rootNavigatorKey,
      home: const Splash(),
      builder: (
        context,
        Widget? widget,
      ) {
        return widget ?? const SizedBox.shrink();
      },
    );
  }
}
