import 'package:dartz/dartz.dart';

import 'package:tracking_app/core/utils/error_handler.dart';
import 'package:tracking_app/features/auth/login/data/model/login_request.dart';
import 'package:tracking_app/features/auth/login/data/model/login_response.dart';

abstract class LoginContract {
  Future<Either<Failure, LoginResponse>> login({
    required LoginRequest loginRequest,
  });
}