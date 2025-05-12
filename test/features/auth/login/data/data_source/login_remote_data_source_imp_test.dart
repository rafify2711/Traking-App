import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/api_manger/api_service.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/core/utils/Errors/error_handler.dart';
import 'package:tracking_app/features/auth/login/data/data_source/login_remote_data_source_imp.dart';
import 'package:tracking_app/features/auth/login/data/model/login_request.dart';
import 'package:tracking_app/features/auth/login/data/model/login_response.dart';

import 'login_remote_data_source_imp_test.mocks.dart';


@GenerateMocks([ApiService])
void main() {
  late ApiService apiService;
  late LoginRemoteDataSourceImp dataSource;
  setUp(() {
    apiService = MockApiService();
    dataSource = LoginRemoteDataSourceImp(apiService: apiService);
  });

  group(' test Login data source impl', () {
    test(
      'should return LoginResponse when data source success',
          () async {
        final request = LoginRequest(email: 'email',password: "");
        final expected = LoginResponse(message: "sa", token: "token");
        when(
          apiService.loginUser(request),
        ).thenAnswer((_) async => expected);
        final actual = await dataSource.login(loginRequest: request);
        verify(apiService.loginUser(request)).called(1);
        expect(actual, isA<ApiSuccess<LoginResponse>>());
      },
    );
    test('should return ApiError when data source fails', () async {
      final request = LoginRequest(email: 'email',password: "s");

      when(
        apiService.loginUser(request),
      ).thenThrow(ServerFailure(errorMessage: 'error'));
      final actual = await dataSource.login(loginRequest: request);
      verify(apiService.loginUser(request)).called(1);
      expect(actual, isA<ApiError<LoginResponse>>());
    });
  });
}