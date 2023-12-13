import 'package:code_demonstration/ui_kit/loaders/cupertino_loader.dart';
import 'package:flutter/material.dart';

class PrimaryLoader extends StatelessWidget {
  final Color? color;
  final double? radius;

  const PrimaryLoader({
    Key? key,
    this.color,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoLoader(
        color: color,
        radius: radius,
      ),
    );
  }
}

class LightLoader extends StatelessWidget {
  const LightLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: LightCupertinoLoader());
  }
}
