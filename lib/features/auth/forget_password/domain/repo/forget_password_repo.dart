import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/request/forget_password_request.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/request/otp_request.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/request/reset_password_request.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/response/forget_password_response.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/response/otp_response.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/response/reset_password_response.dart';

abstract class ForgetPasswordRepo {
  Future<ApiResult<ForgetPasswordResponse>> forgetPassword(
    ForgetPasswordRequest forgetPasswordRequest,
  );
  Future<ApiResult<OtpResponse>> sendVerifyCode(OtpRequest otpRequest);
  Future<ApiResult<ResetPasswordResponse>> resetPassword(
    ResetPasswordRequest resetPasswordRequest,
  );
}
