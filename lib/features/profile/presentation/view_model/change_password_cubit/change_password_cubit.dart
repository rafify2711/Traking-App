import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/profile/domain/use_case/change_password_use_case.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this.changePasswordUseCase)
    : super(ChangePasswordInitial());
  final ChangePasswordUseCase changePasswordUseCase;

  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    emit(ChangePasswordLoading());

    final result = await changePasswordUseCase.invoke(
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
    switch (result) {
      case ApiSuccess<Map<String, dynamic>>():
        {
          emit(
            ChangePasswordSuccess(
              data: result.data ?? {},
            ),
          );
        }

      case ApiError<Map<String, dynamic>>():
        {
          emit(
            ChangePasswordFailure(
              errorMessage: result.failure?.errorMessage ?? 'Unknown error',
            ),
          );
        }
        break;
    }
  }
}
