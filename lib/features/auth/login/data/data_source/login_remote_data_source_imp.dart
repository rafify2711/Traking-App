import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_manger/api_service.dart';
import 'package:tracking_app/core/di/di.dart';
import 'package:tracking_app/features/auth/login/data/data_source/login_remote_data_source.dart';
import 'package:tracking_app/features/auth/login/data/model/login_request.dart';
import 'package:tracking_app/features/auth/login/data/model/login_response.dart';

@Injectable(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImp implements LoginRemoteDataSource {
  final apiServices = getIt<ApiService>();
  final ApiService apiService;
  LoginRemoteDataSourceImp({required this.apiService});

  @override
  Future<LoginResponse> login({required LoginRequest loginRequest}) async {
    final response = await apiServices.loginUser(loginRequest);
    return response;
  }
}