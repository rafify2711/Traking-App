// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/request/otp_request.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/response/otp_response.dart';
import 'package:tracking_app/features/auth/forget_password/domain/repo/forget_password_repo.dart';

@injectable
class SenVerifyCodeUseCase {
  ForgetPasswordRepo repo;
  SenVerifyCodeUseCase({required this.repo});
  Future<ApiResult<OtpResponse>> invoke(OtpRequest otpRequest) async {
    return await repo.sendVerifyCode( otpRequest);
  }
}
