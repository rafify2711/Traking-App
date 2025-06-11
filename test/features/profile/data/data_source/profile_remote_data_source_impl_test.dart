import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/api_manger/api_service.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/core/utils/Errors/error_handler.dart';
import 'package:tracking_app/features/profile/data/data_source/profile_remote_data_source_impl.dart';
import 'package:tracking_app/features/profile/data/model/get_logged_driver_data_response.dart';
import 'package:tracking_app/features/profile/data/model/get_vehicle_response.dart';

import 'profile_remote_data_source_impl_test.mocks.dart';


@GenerateMocks([ApiService])
void main() {
  late ApiService apiService;
  late ProfileRemoteDataSourceImpl dataSource;

  setUp(() {
    apiService = MockApiService();
    dataSource = ProfileRemoteDataSourceImpl( apiService: apiService);
  });

  group('ProfileRemoteDataSourceImpl', () {

    test(
      'should return ApiSuccess<GetLoggedDriverDataResponse> when getLoggedDriverData succeeds',
      () async {
        // Arrange
        final expectedResponse = GetLoggedDriverDataResponse();
        when(
          apiService.getLoggedDriverData(),
        ).thenAnswer((_) async => expectedResponse);

        // Act
        final result = await dataSource.getLoggedDriverData();

        // Assert
        verify(apiService.getLoggedDriverData()).called(1);
        expect(result, isA<ApiSuccess<GetLoggedDriverDataResponse>>());
      },
    );

    test(
      'should return ApiError<GetLoggedDriverDataResponse> when getLoggedDriverData fails',
      () async {
        // Arrange
        when(
          apiService.getLoggedDriverData(),
        ).thenThrow(ServerFailure(errorMessage: 'error'));

        // Act
        final result = await dataSource.getLoggedDriverData();

        // Assert
        verify(apiService.getLoggedDriverData()).called(1);
        expect(result, isA<ApiError<GetLoggedDriverDataResponse>>());
      },
    );
    const vehicleId = '676b64279f3884b3405c14c5';

    test(
      'should return ApiSuccess<GetVehicle> when getVechileName succeeds',
          () async {
        // Arrange
        final expectedResponse = GetVehicleResponse();
        when(
          apiService.getSpecificVehicleName(vehicleId),
        ).thenAnswer((_) async => expectedResponse);

        // Act
        final result = await dataSource.getVechileName(vehicleId);

        // Assert
        verify(apiService.getSpecificVehicleName(vehicleId)).called(1);
        expect(result, isA<ApiSuccess<GetVehicleResponse>>());
      },
    );

    test(
      'should return ApiError<GetVehicle> when getVechileName fails',
          () async {
        // Arrange
        when(
          apiService.getSpecificVehicleName(vehicleId),
        ).thenThrow(ServerFailure(errorMessage: 'error'));

        // Act
        final result = await dataSource.getVechileName(vehicleId);

        // Assert
        verify(apiService.getSpecificVehicleName(vehicleId)).called(1);
        expect(result, isA<ApiError<GetVehicleResponse>>());
      },
    );
  });
}
