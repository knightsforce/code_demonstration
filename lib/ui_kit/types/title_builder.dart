import 'package:flutter/widgets.dart';

typedef TitleBuilder = Widget Function(
  String? titleText, {
  required bool isError,
});
