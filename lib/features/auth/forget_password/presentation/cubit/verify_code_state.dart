// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'verify_code_cubit.dart';

class VerifyCodeState extends Equatable {
  BaseState? verifyCodeState;
  OtpResponse? otpResponse;
  VerifyCodeState({this.verifyCodeState, this.otpResponse});
  VerifyCodeState copyWith({
    BaseState? verifyCodeState,
    OtpResponse? otpResponse,
  }) {
    return VerifyCodeState(
      verifyCodeState: verifyCodeState ?? this.verifyCodeState,
      otpResponse: otpResponse ?? this.otpResponse,
    );
  }

  @override
  List<Object?> get props => [verifyCodeState];
}
