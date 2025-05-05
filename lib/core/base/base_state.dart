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
  Exception? exception;
  BaseError(this.errorMessage, {this.exception});
}
class BaseSuccess<T> extends BaseState<T> {
  final T data;
  BaseSuccess(this.data);
}