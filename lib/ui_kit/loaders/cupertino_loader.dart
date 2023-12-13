import 'package:flutter/cupertino.dart';

class CupertinoLoader extends StatelessWidget {
  final Color? color;
  final double? radius;

  const CupertinoLoader({
    Key? key,
    this.color,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (color == null) {
      return CupertinoActivityIndicator(
        radius: radius ?? 12,
      );
    }

    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        color!,
        BlendMode.srcATop,
      ),
      child: CupertinoActivityIndicator(
        radius: radius ?? 12,
      ),
    );
  }
}

class LightCupertinoLoader extends StatelessWidget {
  const LightCupertinoLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoActivityIndicator(
      radius: 12,
      color: const CupertinoDynamicColor.withBrightness(
        color: CupertinoColors.white,
        darkColor: CupertinoColors.black,
      ),
    );
  }
}
