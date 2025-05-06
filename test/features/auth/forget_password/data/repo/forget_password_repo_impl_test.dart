import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/core/utils/error_handler.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/request/forget_password_request.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/request/otp_request.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/response/forget_password_response.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/response/otp_response.dart';
import 'package:tracking_app/features/auth/forget_password/data/repo/forget_password_repo_impl.dart';
import 'package:tracking_app/features/auth/forget_password/domain/data_source/forget_password_data_source.dart';
import 'package:tracking_app/features/auth/forget_password/domain/repo/forget_password_repo.dart';
import 'forget_password_repo_impl_test.mocks.dart';

@GenerateMocks([ForgetPasswordDataSource])
void main() {
  late MockForgetPasswordDataSource mockRepo;
  late ForgetPasswordRepo repo;
  setUp(() {
    mockRepo = MockForgetPasswordDataSource();
    repo = ForgetPasswordRepoImpl(dataSource: mockRepo);
  });
  group('test forget password repo impl ', () {
    test(
      'when call forget password repo should call sendVerifyCode from forget password data source and it should return ApiSuccess<OtpResponse>',
      () async {
        //arrange
        final otpRequest = OtpRequest(resetCode: '123456');
        final otpResponse = OtpResponse();
        var result = ApiSuccess<OtpResponse>(data: otpResponse);
        provideDummy<ApiResult<OtpResponse>>(result);
        when(
          mockRepo.sendVerifyCode(otpRequest),
        ).thenAnswer((_) async => result);
        //act
        final actual = await repo.sendVerifyCode(otpRequest);
        //assert
        verify(mockRepo.sendVerifyCode(otpRequest)).called(1);
        expect(actual, result);
      },
    );
    test('should return ApiError when data source fails', () async {
      final request = OtpRequest(resetCode: '123456');
      final expected = ApiError<OtpResponse>(
        message: 'Network error',
        failure: ServerFailure(errorMessage: 'Network error'),
      );
      provideDummy<ApiResult<OtpResponse>>(expected);

      when(mockRepo.sendVerifyCode(request)).thenAnswer((_) async => expected);

      final actual = await repo.sendVerifyCode(request);

      verify(mockRepo.sendVerifyCode(request)).called(1);
      expect(actual, equals(expected));
    });
  });
  group('test forget password repo impl', () {
    test(
      'when call forget password repo should call forget password data source and it should return Apisuccess<ForgetPasswordResponse>',
      () async {
        //arrange
        final forgetPasswordRequest = ForgetPasswordRequest(email: 'email');
        final forgetPasswordResponse = ForgetPasswordResponse();
        var result = ApiSuccess<ForgetPasswordResponse>(
          data: forgetPasswordResponse,
        );
        provideDummy<ApiResult<ForgetPasswordResponse>>(result);
        when(
          mockRepo.forgetPassword(forgetPasswordRequest),
        ).thenAnswer((_) async => result);
        //act
        final actual = await repo.forgetPassword(forgetPasswordRequest);
        //assert
        verify(mockRepo.forgetPassword(forgetPasswordRequest)).called(1);
        expect(actual, result);
      },
    );
    test('should return ApiError when data source fails', () async {
      final request = ForgetPasswordRequest(email: 'email');
      final expected = ApiError<ForgetPasswordResponse>(
        message: 'Network error',
        failure: ServerFailure(errorMessage: 'Network error'),
      );

      when(mockRepo.forgetPassword(request)).thenAnswer((_) async => expected);

      final actual = await repo.forgetPassword(request);

      verify(mockRepo.forgetPassword(request)).called(1);
      expect(actual, equals(expected));
    });
  });
}
