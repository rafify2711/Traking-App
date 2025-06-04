abstract class LogoutState {}

class LogoutInitial extends LogoutState {}

class LogoutLoading extends LogoutState {}

class LogoutSuccess extends LogoutState {
  // final result;
  // Success(this.result);
}

class LogoutFailure extends LogoutState {
  final String error;
  LogoutFailure(this.error);
}
