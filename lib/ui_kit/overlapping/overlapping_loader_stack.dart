import 'package:code_demonstration/ui_kit/loaders/full_loader.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';

/// Перекрывающий лоадер основанный на [Stack]
class OverlappingLoaderStack extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const OverlappingLoaderStack({
    Key? key,
    bool? isLoading,
    required this.child,
  })  : isLoading = isLoading ?? false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading) FullLoader.over(),
      ],
    );
  }
}

class OverlappingLoaderStackNotifierBuilder extends StatelessWidget {
  final StateNotifier<bool> loadState;
  final Widget child;

  const OverlappingLoaderStackNotifierBuilder({
    Key? key,
    required this.loadState,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateNotifierBuilder<bool>(
      listenableState: loadState,
      builder: (_, bool? isLoading) {
        return OverlappingLoaderStack(
          isLoading: isLoading,
          child: child,
        );
      },
    );
  }
}
