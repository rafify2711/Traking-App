// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:tracking_app/core/base/api_result.dart';

import 'package:tracking_app/core/base/base_state.dart';
import 'package:tracking_app/core/config/routes_name.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/request/forget_password_request.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/response/forget_password_response.dart';
import 'package:tracking_app/features/auth/forget_password/domain/use_cases/forget_password_use_case.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordUseCase forgetPasswordUseCase;
  ForgetPasswordCubit(this.forgetPasswordUseCase)
    : super(ForgetPasswordState());
    TextEditingController forgetPasswordController = TextEditingController(text:
     'mariamkamel791@gmail.com');
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<void> forgetPassword(
    ForgetPasswordRequest forgetPasswordRequest,
  ) async {
    if(formKey.currentState!.validate() == false) return;
    emit(state.copyWith(forgetPasswordState: BaseLoading()));

    final result = await forgetPasswordUseCase.invoke(forgetPasswordRequest);

    if (result is ApiSuccess<ForgetPasswordResponse>) {
      emit(
        state.copyWith(
          forgetPasswordState: BaseSuccess<ForgetPasswordResponse>(
            data: result.data,
          ),
        ),
      );

    } else if (result is ApiError<ForgetPasswordResponse>) {
      emit(
        state.copyWith(
          forgetPasswordState: BaseError<ForgetPasswordResponse>(
            result.message ?? "Something went wrong",
          ),
        ),
      );
    }
  }
}
