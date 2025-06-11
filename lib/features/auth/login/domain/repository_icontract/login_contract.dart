import 'package:tracking_app/core/base/api_result.dart';

import 'package:tracking_app/features/auth/login/data/model/login_request.dart';
import 'package:tracking_app/features/auth/login/data/model/login_response.dart';

abstract class LoginContract {
  Future<ApiResult<LoginResponse>> login({required LoginRequest loginRequest});
}
