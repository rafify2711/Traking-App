// import 'package:bloc_test/bloc_test.dart';
//
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:tracking_app/core/base/api_result.dart';
// import 'package:tracking_app/core/base/base_state.dart';
// import 'package:tracking_app/features/auth/login/data/model/login_request.dart';
// import 'package:tracking_app/features/auth/login/data/model/login_response.dart';
// import 'package:tracking_app/features/auth/login/domain/usecases/login_usecase.dart';
// import 'package:tracking_app/features/auth/login/presentation/view_model/login_cubit.dart';
//
// import 'login_cubit_test.mocks.dart';
//
//
// @GenerateMocks([LoginUsecase])
// void main() {
//   late LoginCubit loginCubit;
//   late LoginUsecase loginUsecase;
//
//   LoginResponse loginResponse = LoginResponse(message: "message", token: "token");
//   group("home view model test", () {
//     setUpAll(() {
//
//       loginUsecase = MockLoginUsecase();
//
//       ApiResult<LoginResponse> loginResult =ApiSuccess(data: loginResponse);
//
//       provideDummy<      ApiResult<LoginResponse>>(loginResult);
//
//       when(loginUsecase.invoke(loginRequest: LoginRequest(email: "asads@gmail.com", password: "SAkfnfds231123@"))).thenAnswer((_)async => loginResult);
//
//     },);
//     setUp(() {
//       loginCubit =LoginCubit(loginUsecase);
//     },);
//     blocTest<LoginCubit,BaseState<LoginResponse>>(
//       'when call do intent with load home page intent it '
//           'should load categories and brands and returns correct states',
//       build: () => loginCubit,
//       act: (a) {
//         a.login(email: "email", password: "password");
//       },
//       expect: () =>[
//         BaseLoading(),
//         BaseSuccess(
//             loginResponse
//         ),
//
//
//       ],
//
//     );
//
//
//
//
//   },);
//
// }