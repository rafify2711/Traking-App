import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/utils/error_handler.dart';

import 'package:tracking_app/features/auth/login/data/data_source/login_remote_data_source.dart';
import 'package:tracking_app/features/auth/login/data/model/login_request.dart';
import 'package:tracking_app/features/auth/login/data/model/login_response.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/auth/login/data/repository_implementation/login_repository_implementation.dart';

import 'login_repository_implementation_test.mocks.dart';

@GenerateMocks([LoginRemoteDataSource])
void main() {
  late MockLoginRemoteDataSource mockRemoteDataSource;
  late LoginRepositoryImplementation repository;

  setUp(() {
    mockRemoteDataSource = MockLoginRemoteDataSource();
    repository = LoginRepositoryImplementation(loginRemoteDataSource: mockRemoteDataSource);
  });

  test('should return ApiSuccess when remote data source succeeds', () async {
    final request = LoginRequest(email: 'test@test.com', password: '123456');
    final response = LoginResponse(message: "ds",token: "sd");
    var result = ApiSuccess<LoginResponse>(data: response);
    provideDummy<ApiResult<LoginResponse>>(result);
    when(mockRemoteDataSource.login(loginRequest: request))
        .thenAnswer((_) async => result);

    final actual = await repository.login(loginRequest: request);

    expect(actual, result);
    verify(mockRemoteDataSource.login(loginRequest: request)).called(1);
  });

  test('should return ApiError when remote data source fails', () async {
    final request = LoginRequest(email: 'fail@test.com', password: 'wrong');
    final expected = ApiError<LoginResponse>(
      message: 'Network error',
      failure: ServerFailure(errorMessage: 'Network error'),
    );
    provideDummy<ApiResult<LoginResponse>>(expected);
    when(mockRemoteDataSource.login(loginRequest: request))
        .thenAnswer((_) async => expected);

    final actual = await repository.login(loginRequest: request);

    expect(actual, expected);
    verify(mockRemoteDataSource.login(loginRequest: request)).called(1);
  });
}
