import 'generic_state_enums.dart';

abstract class GenericState<T> {
  GenericState({
    this.message,
    this.data,
    this.state = GenericStateEnums.initial,
  });

  final GenericStateEnums state;
  final T? data;
  final String? message;

  bool get isLoading => [
        GenericStateEnums.initial,
        GenericStateEnums.loading,
      ].contains(state);

  bool get isInitial => state == GenericStateEnums.initial;

  bool get isLoadingOnly => state == GenericStateEnums.loading;

  bool get isLoaded => state == GenericStateEnums.loaded;

  bool get isFailure => state == GenericStateEnums.failure;

  bool get isFetchingMore => state == GenericStateEnums.fetchingMore;

  String get getErrorMessage => message ?? 'Something went wrong';

  String get getSuccessfulMessage => message ?? 'Task completed Successfully';

  bool get isEmptyAndNotLoading => !isLoading && isEmpty;

  bool get isEmpty {
    if (data == null) {
      return true;
    }
    if (data is List) {
      return (data as List).isEmpty;
    }
    if (data is String) {
      return (data as String).isEmpty;
    }
    return false;
  }

  @override
  String toString() =>
      'Flutter generic state:(state: $state, data: $data, error: $message)';
}
