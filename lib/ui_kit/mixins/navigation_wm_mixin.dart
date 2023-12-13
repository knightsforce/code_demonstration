import 'package:flutter/widgets.dart';

/// Миксин для поставки логики навигации для WidgetModel
mixin NavigationWmMixin {
  BuildContext get context;

  @protected
  late final navigator = Navigator.of(context);

  @protected
  late final rootNavigator = Navigator.of(context, rootNavigator: true);
}
