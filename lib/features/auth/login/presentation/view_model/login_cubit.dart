import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:tracking_app/features/auth/login/data/model/login_request.dart';
import 'package:tracking_app/features/auth/login/domain/usecases/login_usecase.dart';

import 'package:tracking_app/features/auth/login/presentation/view_model/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUseCase) : super(LoginInitial());

  final LoginUsecase loginUseCase;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    final result = await loginUseCase.invoke(loginRequest: LoginRequest(email: email, password: password));
    result.fold(
          (failure) {
        emit(LoginFailure(errorMessage: failure.errorMessage));
      },
          (response) {
        log("in cubit succes");
        emit(LoginSuccess(data: response));
      },
    );
  }
}