// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'forget_password_cubit.dart';

class ForgetPasswordState extends Equatable {
  const ForgetPasswordState({
    this.forgetPasswordState,
    this.forgetPasswordResponse,
  });

  final BaseState<ForgetPasswordResponse>? forgetPasswordState;
  final ForgetPasswordResponse? forgetPasswordResponse;
  ForgetPasswordState copyWith({
    BaseState<ForgetPasswordResponse>? forgetPasswordState,
    ForgetPasswordResponse? forgetPasswordResponse,
  }) {
    return ForgetPasswordState(
      forgetPasswordState: forgetPasswordState ?? this.forgetPasswordState,
      forgetPasswordResponse:
          forgetPasswordResponse ?? this.forgetPasswordResponse,
    );
  }

  @override
  List<Object?> get props => [forgetPasswordState];
}
