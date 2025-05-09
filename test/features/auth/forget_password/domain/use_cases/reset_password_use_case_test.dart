import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/core/utils/Errors/error_handler.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/request/reset_password_request.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/response/reset_password_response.dart';
import 'package:tracking_app/features/auth/forget_password/domain/repo/forget_password_repo.dart';
import 'package:tracking_app/features/auth/forget_password/domain/use_cases/reset_password_use_case.dart';

import 'forget_password_use_case_test.mocks.dart';

@GenerateMocks([ForgetPasswordRepo])
void main() {
  late ForgetPasswordRepo repo;
  late ResetPasswordUseCase useCase;

  setUp(() {
    repo = MockForgetPasswordRepo();
    useCase = ResetPasswordUseCase(repo);
  });

  group('ResetPasswordUseCase', () {
    test(
      'should return ApiSuccess<ResetPasswordResponse> when repo returns success',
      () async {
        final request = ResetPasswordRequest(
          email: 'test@example.com',
          newPassword: 'Test@1234',
        );
        final response = ResetPasswordResponse();
        final expected = ApiSuccess<ResetPasswordResponse>(data: response);

        provideDummy<ApiResult<ResetPasswordResponse>>(expected);
        when(repo.resetPassword(request)).thenAnswer((_) async => expected);

        final actual = await useCase.invoke(request);

        verify(repo.resetPassword(request)).called(1);
        expect(actual, isA<ApiSuccess<ResetPasswordResponse>>());
      },
    );

    test(
      'should return ApiError<ResetPasswordResponse> when repo returns error',
      () async {
        final request = ResetPasswordRequest(
          email: 'test@example.com',
          newPassword: 'Test@1234',
        );
        final expected = ApiError<ResetPasswordResponse>(
          message: 'Reset failed',
          failure: ServerFailure(errorMessage: 'Reset failed'),
        );

        provideDummy<ApiResult<ResetPasswordResponse>>(expected);
        when(repo.resetPassword(request)).thenAnswer((_) async => expected);

        final actual = await useCase.invoke(request);

        verify(repo.resetPassword(request)).called(1);
        expect(actual, isA<ApiError<ResetPasswordResponse>>());
      },
    );
  });
}
