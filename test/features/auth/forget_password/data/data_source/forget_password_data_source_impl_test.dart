import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/api_manger/api_service.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/core/utils/error_handler.dart';
import 'package:tracking_app/features/auth/forget_password/data/data_source/forget_password_data_source_impl.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/request/forget_password_request.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/request/otp_request.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/request/reset_password_request.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/response/forget_password_response.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/response/otp_response.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/response/reset_password_response.dart';

import 'forget_password_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  late ApiService apiService;
  late ForgetPasswordDataSourceImpl dataSource;
  setUp(() {
    apiService = MockApiService();
    dataSource = ForgetPasswordDataSourceImpl(apiService);
  });

  group(' test forget password data source impl', () {
    test(
      'should return forgetPasswordResponse when data source success',
      () async {
        final request = ForgetPasswordRequest(email: 'email');
        final expected = ForgetPasswordResponse();
        when(
          apiService.forgetPassword(request),
        ).thenAnswer((_) async => expected);
        final actual = await dataSource.forgetPassword(request);
        verify(apiService.forgetPassword(request)).called(1);
        expect(actual, isA<ApiSuccess<ForgetPasswordResponse>>());
      },
    );
    test('should return ApiError when data source fails', () async {
      final request = ForgetPasswordRequest(email: 'email');

      when(
        apiService.forgetPassword(request),
      ).thenThrow(ServerFailure(errorMessage: 'error'));
      final actual = await dataSource.forgetPassword(request);
      verify(apiService.forgetPassword(request)).called(1);
      expect(actual, isA<ApiError<ForgetPasswordResponse>>());
    });
  });
  group(' test forget password data source impl', () {
    test('should return OtpResponse when data source success', () async {
      final request = OtpRequest(resetCode: '123456');
      final expected = OtpResponse();
      when(
        apiService.verifyResetCode(request),
      ).thenAnswer((_) async => expected);
      final actual = await dataSource.sendVerifyCode(request);
      verify(apiService.verifyResetCode(request)).called(1);
      expect(actual, isA<ApiSuccess<OtpResponse>>());
    });
    test('should return ApiError when data source fails', () async {
      final request = OtpRequest(resetCode: '123456');
      when(
        apiService.verifyResetCode(request),
      ).thenThrow(ServerFailure(errorMessage: 'error'));
      final actual = await dataSource.sendVerifyCode(request);
      verify(apiService.verifyResetCode(request)).called(1);
      expect(actual, isA<ApiError<OtpResponse>>());
    });
  });
  group(
    " test the reset password method in the forget password data source ",
    () {
      test(
        'should return ResetPasswordResponse when data source success',
        () async {
          final request = ResetPasswordRequest(
            email: 'email@example.com',
            newPassword: 'NewPass@123',
          );
          final expected = ResetPasswordResponse();

          when(
            apiService.resetPassword(request),
          ).thenAnswer((_) async => expected);

          final actual = await dataSource.resetPassword(request);

          verify(apiService.resetPassword(request)).called(1);
          expect(actual, isA<ApiSuccess<ResetPasswordResponse>>());
        },
      );

      test('should return ApiError when reset password fails', () async {
        final request = ResetPasswordRequest(
          email: 'email@example.com',
          newPassword: 'NewPass@123',
        );

        when(
          apiService.resetPassword(request),
        ).thenThrow(ServerFailure(errorMessage: 'error'));

        final actual = await dataSource.resetPassword(request);

        verify(apiService.resetPassword(request)).called(1);
        expect(actual, isA<ApiError<ResetPasswordResponse>>());
      });
    },
  );
}
