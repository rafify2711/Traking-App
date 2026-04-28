sealed class BaseState<T> {
const  BaseState();
}

class BaseInitial<T> extends BaseState<T> {
const  BaseInitial();
}

class BaseLoading<T> extends BaseState<T> {
const  BaseLoading();
}

class BaseError<T> extends BaseState<T> {
  final String? errorMessage;

  const BaseError({this.errorMessage});
}

class BaseSuccess<T> extends BaseState<T> {
  final T? data;
  const BaseSuccess({this.data});
}
