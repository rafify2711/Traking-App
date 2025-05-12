import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/utils/Errors/error_handler.dart';

import 'package:tracking_app/features/auth/login/data/model/login_request.dart';
import 'package:tracking_app/features/auth/login/data/model/login_response.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/auth/login/domain/repository_icontract/login_contract.dart';

import 'login_usecase_test.mocks.dart';


@GenerateMocks([LoginContract])
void main() {
  late LoginContract loginContract;


  setUp(() {
    loginContract=MockLoginContract();
  });

  test('should return ApiSuccess when login succeeds', () async {
    final request = LoginRequest(email: 'test@example.com', password: '123456');
    final expected = LoginResponse(message: "d",token: "");
    var result = ApiSuccess<LoginResponse>(data: expected);
    provideDummy<ApiResult<LoginResponse>>(result);
    when(loginContract.login(loginRequest: request))
        .thenAnswer((_) async => result);

    final actual  = await loginContract.login(loginRequest: request);

    expect(actual,result);
    verify(loginContract.login(loginRequest: request)).called(1);
  });

  test('should return ApiError when login fails', () async {
    final request = LoginRequest(email: 'fail@test.com', password: 'wrong');
    final expected = ApiError<LoginResponse>(
      message: 'Network error',
      failure: ServerFailure(errorMessage: 'Network error'),
    );
    provideDummy<ApiResult<LoginResponse>>(expected);

    when(loginContract.login(loginRequest: request))
        .thenAnswer((_) async =>expected);

    final actual = await loginContract.login(loginRequest: request);

    expect(actual,expected);
    verify(loginContract.login(loginRequest: request)).called(1);
  });
}
