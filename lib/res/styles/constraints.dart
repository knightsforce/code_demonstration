import 'package:flutter/material.dart';

abstract class ConstraintsStyles {
  static const BoxConstraints zero = BoxConstraints(minHeight: 0);

  static const BoxConstraints textFieldBoxConstraints = BoxConstraints(
    minHeight: 50,
    maxHeight: 100,
  );
}
