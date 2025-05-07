


import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/auth/login/data/model/login_request.dart';
import 'package:tracking_app/features/auth/login/data/model/login_response.dart';
import 'package:tracking_app/features/auth/login/domain/repository_icontract/login_contract.dart';

@injectable
class LoginUsecase {
  final LoginContract login_repo;

  LoginUsecase({required this.login_repo});

  Future<ApiResult<LoginResponse>> invoke({
    required LoginRequest loginRequest,
  }) async {
    return await login_repo.login(loginRequest: loginRequest);
  }
}