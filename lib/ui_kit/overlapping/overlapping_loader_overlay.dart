import 'package:code_demonstration/ui_kit/loaders/full_loader.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';

/// Перекрывающий лоадер основанный на Оверлее
/// Использовать если не подошел вариант со стеком
class OverlappingLoaderOverlay extends StatefulWidget {
  final bool isLoading;
  final Widget child;

  const OverlappingLoaderOverlay({
    Key? key,
    bool? isLoading,
    required this.child,
  })  : isLoading = isLoading ?? false,
        super(key: key);

  @override
  State<OverlappingLoaderOverlay> createState() =>
      _OverlappingLoaderOverlayState();
}

class _OverlappingLoaderOverlayState extends State<OverlappingLoaderOverlay> {
  OverlayEntry? _entry;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _update();
    });
  }

  @override
  void didUpdateWidget(covariant OverlappingLoaderOverlay oldWidget) {
    if (oldWidget.isLoading != widget.isLoading) {
      _update();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _create() {
    try {
      _remove();
    } on Exception catch (e) {
      debugPrint(e.toString());
    }

    Future(() {
      _entry = OverlayEntry(
        builder: (_) {
          return FullLoader.over();
        },
      );

      Overlay.of(context).insert(_entry!);
    });
  }

  void _remove() {
    _entry?.remove();
    _entry = null;
  }

  void _update() {
    if (widget.isLoading) {
      _create();
    } else {
      _remove();
    }
  }
}

/// Перекрывающий лоадер с Оверлеем основанный на стриме
/// Использовать если не подошел вариант со стеком
class OverlappingLoaderOverlayNotifierBuilder extends StatelessWidget {
  final StateNotifier<bool> loadState;
  final Widget child;

  const OverlappingLoaderOverlayNotifierBuilder({
    Key? key,
    required this.loadState,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateNotifierBuilder<bool>(
      listenableState: loadState,
      builder: (_, bool? isLoading) {
        return OverlappingLoaderOverlay(
          isLoading: isLoading,
          child: child,
        );
      },
    );
  }
}
