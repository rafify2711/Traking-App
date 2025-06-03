import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/core/utils/Errors/error_handler.dart';
import 'package:tracking_app/features/profile/data/model/get_logged_driver_data_response.dart';
import 'package:tracking_app/features/profile/data/model/get_vehicle_response.dart';
import 'package:tracking_app/features/profile/data/repos/profile_repo_impl.dart';
import 'package:tracking_app/features/profile/domain/repos/profile_repo.dart';
import 'package:tracking_app/features/profile/data/data_source/profile_remote_data_source.dart';
import 'profile_repo_impl_test.mocks.dart';


@GenerateMocks([ProfileRemoteDataSource])
void main() {
  late MockProfileRemoteDataSource mockDataSource;
  late ProfileRepo repo;

  setUp(() {
    mockDataSource = MockProfileRemoteDataSource();
    repo = ProfileRepoImpl(mockDataSource);
  });

  group('ProfileRepoImpl Tests', () {

    test(
      'should return ApiSuccess<GetLoggedDriverDataResponse> when getLoggedDriverData succeeds',
          () async {
        // arrange
        final response = GetLoggedDriverDataResponse(); // You can provide mock data here
        final expected = ApiSuccess<GetLoggedDriverDataResponse>(data: response);
        provideDummy<ApiResult<GetLoggedDriverDataResponse>>(expected);

        when(
          mockDataSource.getLoggedDriverData(),
        ).thenAnswer((_) async => expected);

        // act
        final actual = await repo.getLoggedDriverData();

        // assert
        verify(mockDataSource.getLoggedDriverData()).called(1);
        expect(actual, expected);
      },
    );

    test(
      'should return ApiError<GetLoggedDriverDataResponse> when getLoggedDriverData fails',
          () async {
        // arrange
        final expected = ApiError<GetLoggedDriverDataResponse>(
          message: 'Network error',
          failure: ServerFailure(errorMessage: 'Network error'),
        );
        provideDummy<ApiResult<GetLoggedDriverDataResponse>>(expected);

        when(
          mockDataSource.getLoggedDriverData(),
        ).thenAnswer((_) async => expected);

        // act
        final actual = await repo.getLoggedDriverData();

        // assert
        verify(mockDataSource.getLoggedDriverData()).called(1);
        expect(actual, expected);
      },
    );
    const vehicleId = '676b64279f3884b3405c14c5';
    
    test(
      'should return ApiSuccess<GetVehicle> when getVechileName succeeds',
          () async {
        // arrange
        final response = GetVehicleResponse(); // You can provide mock data here
        final expected = ApiSuccess<GetVehicleResponse>(data: response);
        provideDummy<ApiResult<GetVehicleResponse>>(expected);

        when(
          mockDataSource.getVechileName(vehicleId),
        ).thenAnswer((_) async => expected);

        // act
        final actual = await repo.getVechileName(vehicleId);

        // assert
        verify(mockDataSource.getVechileName(vehicleId)).called(1);
        expect(actual, expected);
      },
    );

    test(
      'should return ApiError<GetVehicle> when getVechileName fails',
          () async {
        // arrange
        final expected = ApiError<GetVehicleResponse>(
          message: 'Network error',
          failure: ServerFailure(errorMessage: 'Network error'),
        );
        provideDummy<ApiResult<GetVehicleResponse>>(expected);

        when(
          mockDataSource.getVechileName(vehicleId),
        ).thenAnswer((_) async => expected);

        // act
        final actual = await repo.getVechileName(vehicleId);

        // assert
        verify(mockDataSource.getVechileName(vehicleId)).called(1);
        expect(actual, expected);
      },
    );
  });
}
