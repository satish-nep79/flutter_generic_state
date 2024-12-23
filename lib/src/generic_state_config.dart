import 'package:flutter/material.dart';

 class _GenericStateScreens {
  final Widget loadingScreen;
  final Widget errorScreen;
  final Widget emptyScreen;
  final Widget Function(BuildContext context, VoidCallback onRetry)
      retryButtonBuilder;

  _GenericStateScreens({
    required this.loadingScreen,
    required this.errorScreen,
    required this.emptyScreen,
    required this.retryButtonBuilder,
  });
}

class GenericStateConfig {
  static _GenericStateScreens? _screens;

  static void initialize({
    required Widget loadingScreen,
    required Widget errorScreen,
    required Widget emptyScreen,
    required Widget Function(BuildContext context, VoidCallback onRetry)
        retryButtonBuilder,
  }) {
    _screens = _GenericStateScreens(
      loadingScreen: loadingScreen,
      emptyScreen: emptyScreen,
      errorScreen: errorScreen,
      retryButtonBuilder: retryButtonBuilder
    );
  }

  static _GenericStateScreens get screens {
    if (_screens == null) {
      throw Exception(
        'GenericStateConfig has not been initialized. '
        'Please call GenericStateConfig.initialize() before using it.',
      );
    }
    return _screens!;
  }

}
