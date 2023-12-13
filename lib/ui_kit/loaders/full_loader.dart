import 'package:code_demonstration/ui_kit/loaders/primary_loader.dart';
import 'package:flutter/material.dart';

/// Лоадер занимающий все доступное пространство
class FullLoader extends StatelessWidget {
  final Color backgroundColor;
  final Color? loaderColor;

  const FullLoader({
    Key? key,
    this.backgroundColor = Colors.transparent,
    this.loaderColor,
  }) : super(key: key);

  factory FullLoader.screen({
    Key? key,
  }) =>
      FullLoader(
        key: key,
        backgroundColor: Colors.white,
      );

  factory FullLoader.over({
    Key? key,
  }) =>
      FullLoader(
        key: key,
        backgroundColor: Colors.black,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: backgroundColor,
      child: PrimaryLoader(
        color: loaderColor ?? Colors.white,
      ),
    );
  }
}
