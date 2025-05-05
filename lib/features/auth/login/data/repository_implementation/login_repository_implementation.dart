import 'dart:developer';


import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/utils/error_handler.dart';
import 'package:tracking_app/features/auth/login/data/data_source/login_remote_data_source.dart';
import 'package:tracking_app/features/auth/login/data/model/login_request.dart';
import 'package:tracking_app/features/auth/login/data/model/login_response.dart';
import 'package:tracking_app/features/auth/login/domain/repository_icontract/login_contract.dart';

@Injectable(as: LoginContract)
class LoginRepositoryImplementation implements LoginContract {
  final LoginRemoteDataSource loginRemoteDataSource;
  LoginRepositoryImplementation({required this.loginRemoteDataSource});

  @override
  Future<Either<Failure, LoginResponse>> login({
    required LoginRequest loginRequest,
  }) async {
    try {
      final data = await loginRemoteDataSource.login(loginRequest: loginRequest);
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}