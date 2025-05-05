import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/core/base/base_state.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/request/otp_request.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/response/otp_response.dart';
import 'package:tracking_app/features/auth/forget_password/domain/use_cases/sen_verify_code_use_case.dart';

part 'verify_code_state.dart';

class VerifyCodeCubit extends Cubit<VerifyCodeState> {
  VerifyCodeCubit(this.useCase) : super(VerifyCodeState());
  SenVerifyCodeUseCase useCase;
  sendVerifyCode(OtpRequest otpRequest) async {
    emit(state.copyWith(verifyCodeState: BaseLoading()));
    final result = await useCase.invoke(otpRequest);
    if (result is ApiSuccess<OtpResponse>) {
      emit(state.copyWith(verifyCodeState: BaseSuccess(data: result.data)));
    } else if (result is ApiError<OtpResponse>) {
      emit(
        state.copyWith(
          verifyCodeState: BaseError(result.message ?? "Something went wrong"),
        ),
      );
    }
  }
}
