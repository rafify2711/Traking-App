// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'reset_password_cubit.dart';

class ResetPasswordState extends Equatable {
  final BaseState? resetPasswordState;
  final ResetPasswordResponse? resetPasswordResponse;

  const ResetPasswordState({
    this.resetPasswordState,
    this.resetPasswordResponse,
  });

  ResetPasswordState copyWith({
    BaseState? resetPasswordState,
    ResetPasswordResponse? resetPasswordResponse,
  }) {
    return ResetPasswordState(
      resetPasswordState: resetPasswordState ?? this.resetPasswordState,
      resetPasswordResponse:
          resetPasswordResponse ?? this.resetPasswordResponse,
    );
  }

  @override
  List<Object?> get props => [resetPasswordState, resetPasswordResponse];
}
