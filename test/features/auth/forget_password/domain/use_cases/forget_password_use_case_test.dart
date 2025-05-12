import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/core/utils/Errors/error_handler.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/request/forget_password_request.dart'
    show ForgetPasswordRequest;
import 'package:tracking_app/features/auth/forget_password/data/models/response/forget_password_response.dart';
import 'package:tracking_app/features/auth/forget_password/domain/repo/forget_password_repo.dart';

import 'forget_password_use_case_test.mocks.dart';

@GenerateMocks([ForgetPasswordRepo])
void main() {
  late ForgetPasswordRepo repo;
  setUp(() {
    repo = MockForgetPasswordRepo();
  });

  group('test forget password use case', () {
    test(
      'when call forget password use case should call forget password repo and it should return ApiSuccess<ForgetPasswordResponse>',
      () async {
        //arrange
        final request = ForgetPasswordRequest(email: 'email');
        final expected = ForgetPasswordResponse();
        var result = ApiSuccess<ForgetPasswordResponse>(data: expected);
        provideDummy<ApiResult<ForgetPasswordResponse>>(result);
        when(repo.forgetPassword(request)).thenAnswer((_) async => result);
        //act
        final actual = await repo.forgetPassword(request);
        //assert
        verify(repo.forgetPassword(request)).called(1);
        expect(actual, result);
      },
    );
  });
  test(
    'when call forget password use case should call forget password repo and it should return ApiError<ForgetPasswordResponse>',
    () async {
      //arrange
      final request = ForgetPasswordRequest(email: 'email');
      final expected = ApiError<ForgetPasswordResponse>(
        message: 'Network error',
        failure: ServerFailure(errorMessage: 'Network error'),
      );
      provideDummy<ApiResult<ForgetPasswordResponse>>(expected);

      when(repo.forgetPassword(request)).thenAnswer((_) async => expected);
      //act
      final actual = await repo.forgetPassword(request);
      //assert
      verify(repo.forgetPassword(request)).called(1);
      expect(actual, isA<ApiError<ForgetPasswordResponse>>());
    },
  );
}
