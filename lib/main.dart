import 'package:code_demonstration/app/app.dart';
import 'package:code_demonstration/di/di_container.dart';
import 'package:flutter/material.dart';

void main() async {
  await initDi();
  runApp(const App());
}
