// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'verify_code_cubit.dart';

class VerifyCodeState extends Equatable {
  BaseState? verifyCodeState;
  VerifyCodeState({this.verifyCodeState});
  VerifyCodeState copyWith({BaseState? verifyCodeState}) {
    return VerifyCodeState(
      verifyCodeState: verifyCodeState ?? this.verifyCodeState,
    );
  }

  @override
  List<Object?> get props => [verifyCodeState];
}
