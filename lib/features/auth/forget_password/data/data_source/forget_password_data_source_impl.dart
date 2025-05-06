import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_manger/api_service.dart';
import 'package:tracking_app/core/base/api_excuter.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/request/forget_password_request.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/request/otp_request.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/request/reset_password_request.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/response/forget_password_response.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/response/otp_response.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/response/reset_password_response.dart';
import 'package:tracking_app/features/auth/forget_password/domain/data_source/forget_password_data_source.dart';

@Injectable(as: ForgetPasswordDataSource)
class ForgetPasswordDataSourceImpl implements ForgetPasswordDataSource {
  ApiService apiService;
  ForgetPasswordDataSourceImpl(this.apiService);
  @override
  Future<ApiResult<ForgetPasswordResponse>> forgetPassword(
    ForgetPasswordRequest forgetPasswordRequest,
  ) async {
    return await apiExecuter<ForgetPasswordResponse>(() async {
      var response = await apiService.forgetPassword(forgetPasswordRequest);
      return response;
    }, 'ForgetPasswordDataSourceImpl');
  }

  @override
  Future<ApiResult<OtpResponse>> sendVerifyCode(OtpRequest otpRequest) async {
    return await apiExecuter<OtpResponse>(() async {
      var response = await apiService.verifyResetCode(otpRequest);
      return response;
    }, 'sendVerifyCodedataSourceImpl');
  }

  @override
  Future<ApiResult<ResetPasswordResponse>> resetPassword(
    ResetPasswordRequest resetPasswordRequest,
  ) async {
    return await apiExecuter<ResetPasswordResponse>(() async {
      var response = await apiService.resetPassword(resetPasswordRequest);
      return response;
    }, 'ResetPassworddataSourceImpl');
  }
}
