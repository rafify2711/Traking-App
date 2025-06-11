import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/core/base/base_state.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/request/reset_password_request.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/response/reset_password_response.dart';
import 'package:tracking_app/features/auth/forget_password/domain/use_cases/reset_password_use_case.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordUseCase useCase;

  ResetPasswordCubit(this.useCase) : super(const ResetPasswordState());

  var newPasswordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  Future<void> resetPassword(ResetPasswordRequest request) async {
    emit(
      state.copyWith(resetPasswordState: BaseLoading<ResetPasswordResponse>()),
    );

    final result = await useCase.invoke(request);

    if (result is ApiSuccess<ResetPasswordResponse>) {
      emit(
        state.copyWith(
          resetPasswordState: BaseSuccess<ResetPasswordResponse>(
            data: result.data,
          ),
          resetPasswordResponse: result.data,
        ),
      );
    } else if (result is ApiError<ResetPasswordResponse>) {
      emit(
        state.copyWith(
          resetPasswordState: BaseError<ResetPasswordResponse>(
            errorMessage: result.failure?.errorMessage ?? 'Unknown error',
          ),
        ),
      );
    }
  }
}
