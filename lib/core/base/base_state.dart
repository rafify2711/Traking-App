import 'package:tracking_app/core/utils/error_handler.dart';

sealed class BaseState<T> {
  BaseState();
}

class BaseInitial<T> extends BaseState<T> {
  BaseInitial();
}

class BaseLoading<T> extends BaseState<T> {
  BaseLoading();
}


class BaseError<T> extends BaseState<T> {
  final String errorMessage;
  Failure? failure;
  BaseError(this.errorMessage, {this.failure});
}

class BaseSuccess<T> extends BaseState<T> {
  final T? data;
  BaseSuccess({this.data});
}
