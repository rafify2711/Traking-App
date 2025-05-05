// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/request/forget_password_request.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/response/forget_password_response.dart';
import 'package:tracking_app/features/auth/forget_password/domain/data_source/forget_password_data_source.dart';
import 'package:tracking_app/features/auth/forget_password/domain/repo/forget_password_repo.dart';

@Injectable(as: ForgetPasswordRepo)
class ForgetPasswordRepoImpl implements ForgetPasswordRepo {
  ForgetPasswordDataSource forgetPasswordDataSource;
  ForgetPasswordRepoImpl({
    required this.forgetPasswordDataSource,
  });
  @override
  Future<ApiResult<ForgetPasswordResponse>> forgetPassword(ForgetPasswordRequest forgetPasswordRequest) async {
    return await forgetPasswordDataSource.forgetPassword(forgetPasswordRequest);
  }
}
