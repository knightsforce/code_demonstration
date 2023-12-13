import 'package:code_demonstration/ui_kit/overlapping/overlapping_loader_overlay.dart';
import 'package:code_demonstration/ui_kit/overlapping/overlapping_loader_stack.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';

/// Перекрывающий лоадер
class OverlappingLoader extends StatelessWidget {
  final bool? isLoading;
  final Widget child;
  final _LoaderType _type;

  const OverlappingLoader.stack({
    Key? key,
    this.isLoading,
    required this.child,
  })  : _type = _LoaderType.stack,
        super(key: key);

  const OverlappingLoader.overlay({
    Key? key,
    this.isLoading,
    required this.child,
  })  : _type = _LoaderType.overlay,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (_type) {
      case _LoaderType.stack:
        return OverlappingLoaderStack(
          isLoading: isLoading,
          child: child,
        );
      case _LoaderType.overlay:
        return OverlappingLoaderOverlay(
          isLoading: isLoading,
          child: child,
        );
    }
  }
}

/// Перекрывающий лоадер основанный на стриме
class OverlappingLoaderNotifierBuilder extends StatelessWidget {
  final StateNotifier<bool> loadState;
  final Widget child;
  final _LoaderType _type;

  const OverlappingLoaderNotifierBuilder.stack({
    Key? key,
    required this.loadState,
    required this.child,
  })  : _type = _LoaderType.stack,
        super(key: key);

  const OverlappingLoaderNotifierBuilder.overlay({
    Key? key,
    required this.loadState,
    required this.child,
  })  : _type = _LoaderType.overlay,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (_type) {
      case _LoaderType.stack:
        return OverlappingLoaderStackNotifierBuilder(
          loadState: loadState,
          child: child,
        );
      case _LoaderType.overlay:
        return OverlappingLoaderOverlayNotifierBuilder(
          loadState: loadState,
          child: child,
        );
    }
  }
}

enum _LoaderType {
  stack,
  overlay,
}
