import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/core/utils/Errors/error_handler.dart';
import 'package:tracking_app/features/profile/data/model/get_vehicle_response.dart';
import 'package:tracking_app/features/profile/domain/repos/profile_repo.dart';
import 'package:tracking_app/features/profile/domain/use_case/get_vechile_name_use_case.dart';

import 'get_vechile_name_use_case_test.mocks.dart';

@GenerateMocks([ProfileRepo])
void main() {
  late ProfileRepo repo;
  late GetVechileNameUseCase useCase;

  setUp(() {
    repo = MockProfileRepo();
    useCase = GetVechileNameUseCase(repo);
  });

  group('GetVechileNameUseCase', () {
    const vehicleId = '676b64279f3884b3405c14c5';

    test(
      'should return ApiSuccess<GetVehicleResponse> when repo returns success',
          () async {
        // Arrange
        final response = GetVehicleResponse(); // Mock data can be added here
        final expected = ApiSuccess<GetVehicleResponse>(data: response);

        provideDummy<ApiResult<GetVehicleResponse>>(expected);
        when(repo.getVechileName(vehicleId)).thenAnswer((_) async => expected);

        // Act
        final actual = await useCase.invoke(vehicleId);

        // Assert
        verify(repo.getVechileName(vehicleId)).called(1);
        expect(actual, isA<ApiSuccess<GetVehicleResponse>>());
      },
    );

    test(
      'should return ApiError<GetVehicleResponse> when repo returns error',
          () async {
        // Arrange
        final expected = ApiError<GetVehicleResponse>(
          message: 'Failed to fetch orders',
          failure: ServerFailure(errorMessage: 'Failed to fetch orders'),
        );

        provideDummy<ApiResult<GetVehicleResponse>>(expected);
        when(repo.getVechileName(vehicleId)).thenAnswer((_) async => expected);

        // Act
        final actual = await useCase.invoke(vehicleId);

        // Assert
        verify(repo.getVechileName(vehicleId)).called(1);
        expect(actual, isA<ApiError<GetVehicleResponse>>());
      },
    );
  });
}
