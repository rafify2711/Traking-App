import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/core/utils/error_handler.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/request/otp_request.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/response/otp_response.dart';
import 'package:tracking_app/features/auth/forget_password/domain/repo/forget_password_repo.dart';

import 'forget_password_use_case_test.mocks.dart';

void main() {
  late ForgetPasswordRepo repo;
  setUp(() {
    repo = MockForgetPasswordRepo();
  });

  group('test forget password use case', () {
    test(
      'when call forget password use case should call forget password repo and it should return ApiSuccess<OtpResponse>',
      () async {
        //arrange
        final request = OtpRequest(resetCode: 'resetCode');
        final expected = OtpResponse();
        var result = ApiSuccess<OtpResponse>(data: expected);
        provideDummy<ApiResult<OtpResponse>>(result);
        when(repo.sendVerifyCode(request)).thenAnswer((_) async => result);
        //act
        final actual = await repo.sendVerifyCode(request);
        //assert
        verify(repo.sendVerifyCode(request)).called(1);
        expect(actual, result);
      },
    );
  });
  test(
    'when call forget password use case should call forget password repo and it should return ApiError<OtpResponse>',
    () async {
      //arrange
      final request = OtpRequest(resetCode: 'resetCode');
        final expected = ApiError<OtpResponse>(
        message: 'Network error',
        failure: ServerFailure(errorMessage: 'Network error'),
      );
        provideDummy<ApiResult<OtpResponse>>(expected);

      when(repo.sendVerifyCode(request)).thenAnswer((_) async => expected);
      //act
      final actual = await repo.sendVerifyCode(request);
      //assert
      verify(repo.sendVerifyCode(request)).called(1);
      expect(actual, isA<ApiError<OtpResponse>>());
    },
  );
}
