
import 'package:bloc/bloc.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/core/base/base_state.dart';
import 'package:tracking_app/features/auth/login/data/model/login_request.dart';
import 'package:tracking_app/features/auth/login/data/model/login_response.dart';
import 'package:tracking_app/features/auth/login/domain/usecases/login_usecase.dart';


class LoginCubit extends Cubit<BaseState<LoginResponse>> {
  LoginCubit(this.loginUseCase) : super(BaseInitial());

  final LoginUsecase loginUseCase;

  Future<void> login({required String email, required String password}) async {
    emit(BaseLoading());
    final result = await loginUseCase.invoke(loginRequest: LoginRequest(email: email, password: password));
    switch(result){
      case ApiSuccess():{
        emit(BaseSuccess(data:  result.data!));

      }
      case ApiError():{
        emit(BaseError(result.message!,failure: result.failure));

      }
    }
  }
}