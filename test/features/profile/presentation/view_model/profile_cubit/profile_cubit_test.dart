import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/core/base/base_state.dart';
import 'package:tracking_app/core/utils/Errors/error_handler.dart';
import 'package:tracking_app/features/profile/data/model/get_logged_driver_data_response.dart';
import 'package:tracking_app/features/profile/data/model/get_vehicle_response.dart';
import 'package:tracking_app/features/profile/domain/use_case/get_vechile_name_use_case.dart';
import 'package:tracking_app/features/profile/domain/use_case/get_logged_driver_data_use_case.dart';
import 'package:tracking_app/features/profile/presentation/view_model/profile_cubit/profile_cubit.dart';

import 'profile_cubit_test.mocks.dart';


@GenerateMocks([GetLoggedDriverDataUseCase, GetVechileNameUseCase])
void main() {
  late MockGetLoggedDriverDataUseCase mockLoggedDriverDataUseCase;
  late MockGetVechileNameUseCase mockVechileNameUseCase;

  setUp(() {
    mockLoggedDriverDataUseCase = MockGetLoggedDriverDataUseCase();
    mockVechileNameUseCase = MockGetVechileNameUseCase();
  });
  group('ProfileCubit', () {
    final driverData = GetLoggedDriverDataResponse();
    final vehicleData = GetVehicleResponse();
    const vehicleId = '676b64279f3884b3405c14c5';


    blocTest<ProfileCubit, ProfileState>(
      'emits [Loading, Success] when getLoggedDriverData succeeds',
      build: () {
        final expected = ApiSuccess<GetLoggedDriverDataResponse>(
          data: driverData,
        );

        provideDummy<ApiResult<GetLoggedDriverDataResponse>>(expected);

        when(mockLoggedDriverDataUseCase.invoke()).thenAnswer(
          (_) async =>
              ApiSuccess<GetLoggedDriverDataResponse>(data: driverData),
        );
        return ProfileCubit(
          mockLoggedDriverDataUseCase,
          mockVechileNameUseCase,
        );
      },
      act: (cubit) => cubit.getLoggedDriverData(),
      expect:
          () => [
            isA<ProfileState>().having(
              (s) => s.orderState,
              'loading',
              isA<BaseLoading<GetLoggedDriverDataResponse>>(),
            ),
            isA<ProfileState>()
                .having(
                  (s) => s.orderState,
                  'success',
                  isA<BaseSuccess<GetLoggedDriverDataResponse>>(),
                )
                .having(
                  (s) => (s.orderState as BaseSuccess).data,
                  'driverData',
                  driverData,
                ),
          ],
      verify: (_) {
        verify(mockLoggedDriverDataUseCase.invoke()).called(1);
      },
    );

    blocTest<ProfileCubit, ProfileState>(
      'emits [Loading, Error] when getLoggedDriverData fails',
      build: () {
        final expected = ApiError<GetLoggedDriverDataResponse>(
          message: driverData.message,
        );

        provideDummy<ApiResult<GetLoggedDriverDataResponse>>(expected);

        when(mockLoggedDriverDataUseCase.invoke()).thenAnswer(
          (_) async => ApiError<GetLoggedDriverDataResponse>(
            failure: Failure(errorMessage: 'getLoggedDriverData error'),
          ),
        );
        return ProfileCubit(
          mockLoggedDriverDataUseCase,
          mockVechileNameUseCase,
        );
      },
      act: (cubit) => cubit.getLoggedDriverData(),
      expect:
          () => [
            isA<ProfileState>().having(
              (s) => s.orderState,
              'loading',
              isA<BaseLoading<GetLoggedDriverDataResponse>>(),
            ),
            isA<ProfileState>()
                .having(
                  (s) => s.orderState,
                  'error',
                  isA<BaseError<GetLoggedDriverDataResponse>>(),
                )
                .having(
                  (s) => (s.orderState as BaseError).errorMessage,
                  'error',
                  contains("getLoggedDriverData error"),
                ),
          ],
      verify: (_) {
        verify(mockLoggedDriverDataUseCase.invoke()).called(1);
      },
    );

    blocTest<ProfileCubit, ProfileState>(
      'emits [Loading, Success] when getVechileName succeeds',
      build: () {
        final expected = ApiSuccess<GetVehicleResponse>(data: vehicleData);

        provideDummy<ApiResult<GetVehicleResponse>>(expected);
        when(mockVechileNameUseCase.invoke(vehicleId)).thenAnswer(
          (_) async => ApiSuccess<GetVehicleResponse>(data: vehicleData),
        );
        return ProfileCubit(
          mockLoggedDriverDataUseCase,
          mockVechileNameUseCase,
        );
      },
      act: (cubit) => cubit.getVechileName(vehicleId),
      expect:
          () => [
            isA<ProfileState>().having(
              (s) => s.vehicleNameState,
              'loading',
              isA<BaseLoading<GetVehicleResponse>>(),
            ),
            isA<ProfileState>()
                .having(
                  (s) => s.vehicleNameState,
                  'success',
                  isA<BaseSuccess<GetVehicleResponse>>(),
                )
                .having(
                  (s) => (s.vehicleNameState as BaseSuccess).data,
                  'vehicleData',
                  vehicleData,
                ),
          ],
      verify: (_) {
        verify(mockVechileNameUseCase.invoke(vehicleId)).called(1);
      },
    );

    blocTest<ProfileCubit, ProfileState>(
      'emits [Loading, Error] when getVechileName fails',
      build: () {
        final expected = ApiError<GetVehicleResponse>(
          message: driverData.message,
        );

        provideDummy<ApiResult<GetVehicleResponse>>(expected);

        when(mockVechileNameUseCase.invoke(vehicleId)).thenAnswer(
          (_) async =>
              ApiError<GetVehicleResponse>(failure: Failure(errorMessage: 'getVechileName error')),
        );
        return ProfileCubit(
          mockLoggedDriverDataUseCase,
          mockVechileNameUseCase,
        );
      },
      act: (cubit) => cubit.getVechileName(vehicleId),
      expect:
          () => [
            isA<ProfileState>().having(
              (s) => s.vehicleNameState,
              'loading',
              isA<BaseLoading<GetVehicleResponse>>(),
            ),
            isA<ProfileState>()
                .having(
                  (s) => s.vehicleNameState,
                  'error',
                  isA<BaseError<GetVehicleResponse>>(),
                )
                .having(
                  (s) => (s.vehicleNameState as BaseError).errorMessage,
                  'error',
                  contains("getVechileName error"),
                ),
          ],
      verify: (_) {
        verify(mockVechileNameUseCase.invoke(vehicleId)).called(1);
      },
    );
  });
}
