
import 'package:tracking_app/features/auth/login/data/model/login_request.dart';
import 'package:tracking_app/features/auth/login/data/model/login_response.dart';

abstract class LoginRemoteDataSource {
  Future<LoginResponse> login({required LoginRequest loginRequest});
}