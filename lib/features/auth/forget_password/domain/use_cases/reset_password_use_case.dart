import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/request/reset_password_request.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/response/reset_password_response.dart';
import 'package:tracking_app/features/auth/forget_password/domain/repo/forget_password_repo.dart';

@injectable
class ResetPasswordUseCase {
  ForgetPasswordRepo repo;
  ResetPasswordUseCase(this.repo);
  Future<ApiResult<ResetPasswordResponse>> invoke(
    ResetPasswordRequest resetPasswordRequest,
  ) async {
    return await repo.resetPassword(resetPasswordRequest);
  }
}
