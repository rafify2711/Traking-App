// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'forget_password_cubit.dart';

class ForgetPasswordState extends Equatable {
  const ForgetPasswordState({
    this.forgetPasswordState,
  });

  final BaseState? forgetPasswordState;

  ForgetPasswordState copyWith({BaseState? forgetPasswordState, }) {
    return ForgetPasswordState(
      forgetPasswordState: forgetPasswordState ?? this.forgetPasswordState,
      
    );
  }

  @override
  List<Object?> get props => [forgetPasswordState];
}
