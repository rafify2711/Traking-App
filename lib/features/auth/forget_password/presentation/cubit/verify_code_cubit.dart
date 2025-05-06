import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/core/base/base_state.dart';
import 'package:tracking_app/core/di/di.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/request/otp_request.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/response/otp_response.dart';
import 'package:tracking_app/features/auth/forget_password/domain/use_cases/forget_password_use_case.dart';
import 'package:tracking_app/features/auth/forget_password/domain/use_cases/sen_verify_code_use_case.dart';

part 'verify_code_state.dart';

class VerifyCodeCubit extends Cubit<VerifyCodeState> {
  VerifyCodeCubit(this.useCase) : super(VerifyCodeState());
  var otpController = TextEditingController();
  ForgetPasswordUseCase forgetPasswordUseCase = getIt<ForgetPasswordUseCase>();
  SenVerifyCodeUseCase useCase;
  
     Future<void> close() {
       otpController.dispose();
       return super.close();
     }
  sendVerifyCode(OtpRequest otpRequest) async {
    emit(state.copyWith(verifyCodeState: BaseLoading<OtpResponse>()));
    final result = await useCase.invoke(otpRequest);
    if (result is ApiSuccess<OtpResponse>) {
      emit(state.copyWith(verifyCodeState: BaseSuccess<OtpResponse>(data: result.data)));
    } else if (result is ApiError<OtpResponse>) {
      emit(
        state.copyWith(
          verifyCodeState: BaseError<OtpResponse>(result.failure?.errorMessage ?? "Something went wrong"),
        ),
      );
    }

    
  }
 
} 
