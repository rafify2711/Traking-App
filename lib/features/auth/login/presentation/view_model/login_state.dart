import 'package:equatable/equatable.dart';
import 'package:tracking_app/features/auth/login/data/model/login_response.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final LoginResponse data; // Change from Map<String, dynamic> to LoginResponse

  const LoginSuccess({required this.data});
}

final class LoginFailure extends LoginState {
  final String errorMessage;

  const LoginFailure({required this.errorMessage});
}