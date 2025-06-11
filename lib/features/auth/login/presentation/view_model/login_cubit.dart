import 'package:bloc/bloc.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/core/base/base_state.dart';
import 'package:tracking_app/features/auth/login/data/model/login_request.dart';
import 'package:tracking_app/features/auth/login/data/model/login_response.dart';
import 'package:tracking_app/features/auth/login/domain/usecases/login_usecase.dart';
import 'package:tracking_app/features/auth/login/presentation/view_model/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUseCase) : super(LoginState());

  final LoginUsecase loginUseCase;

  Future<void> login({required String email, required String password}) async {
    emit(state.copyWith(loginState: BaseLoading()));
    final result = await loginUseCase.invoke(
      loginRequest: LoginRequest(email: email, password: password),
    );
    switch (result) {
      case ApiSuccess<LoginResponse>():
        {
          emit(
            state.copyWith(
              loginState: BaseSuccess<LoginResponse>(data: result.data),
            ),
          );
        }
      case ApiError<LoginResponse>():
        {
          emit(
            state.copyWith(
              loginState: BaseError<LoginResponse>(
                errorMessage:
                    result.failure?.errorMessage ?? "Something went wrong",
              ),
            ),
          );
        }
    }
  }
}
