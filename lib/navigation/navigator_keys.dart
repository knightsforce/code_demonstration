import 'package:flutter/material.dart';

class NavigatorManager {
  static final NavigatorManager instance = NavigatorManager._();

  final rootNavigatorKey = GlobalKey<NavigatorState>();

  NavigatorManager._();

  factory NavigatorManager() {
    return instance;
  }
}
