import 'package:flutter/material.dart';
import 'package:flutter_generic_state/src/generic_state_config.dart';
import 'generic_state.dart';

class GenericStateBuilder<T> extends StatelessWidget {
  const GenericStateBuilder({
    required this.state,
    required this.onSuccess,
    super.key,
    this.isLoadingOverride,
    this.isEmptyCheck,
    this.onLoading,
    this.onError,
    this.onEmpty,
  });

  final GenericState<T> state;
  final bool Function()? isLoadingOverride;
  final bool Function()? isEmptyCheck;
  final Widget Function(BuildContext context, T data) onSuccess;
  final Widget Function(BuildContext context)? onLoading;
  final Widget Function(BuildContext context)? onError;
  final Widget Function(BuildContext context)? onEmpty;

  @override
  Widget build(BuildContext context) {
    if (isLoadingOverride?.call() ?? state.isLoading) {
      return Center(
        child: onLoading?.call(context) ??
            GenericStateConfig.screens.loadingScreen,
      );
    } else if (state.isFailure) {
      return Center(
        child: onError?.call(context) ?? GenericStateConfig.screens.errorScreen,
      );
    } else if (isEmptyCheck?.call() ?? state.isEmpty) {
      return Center(
        child: onEmpty?.call(context) ?? GenericStateConfig.screens.emptyScreen,
      );
    } else if (state.isLoaded || state.isFetchingMore) {
      return onSuccess(
        context,
        state.data as T,
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
