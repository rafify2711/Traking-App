import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/core/utils/Errors/error_handler.dart';
import 'package:tracking_app/features/profile/data/model/get_logged_driver_data_response.dart';
import 'package:tracking_app/features/profile/domain/repos/profile_repo.dart';
import 'package:tracking_app/features/profile/domain/use_case/get_logged_driver_data_use_case.dart';

import 'get_logged_driver_data_use_case_test.mocks.dart';

@GenerateMocks([ProfileRepo])
void main() {
  late ProfileRepo repo;
  late GetLoggedDriverDataUseCase useCase;

  setUp(() {
    repo = MockProfileRepo();
    useCase = GetLoggedDriverDataUseCase(repo);
  });

  group('GetLoggedDriverDataUseCase', () {

    test(
      'should return ApiSuccess<GetLoggedDriverDataResponse> when repo returns success',
          () async {
        // Arrange
        final response = GetLoggedDriverDataResponse(); // Mock data can be added here
        final expected = ApiSuccess<GetLoggedDriverDataResponse>(data: response);

        provideDummy<ApiResult<GetLoggedDriverDataResponse>>(expected);
        when(repo.getLoggedDriverData()).thenAnswer((_) async => expected);

        // Act
        final actual = await useCase.invoke();

        // Assert
        verify(repo.getLoggedDriverData()).called(1);
        expect(actual, isA<ApiSuccess<GetLoggedDriverDataResponse>>());
      },
    );

    test(
      'should return ApiError<GetLoggedDriverDataResponse> when repo returns error',
          () async {
        // Arrange
        final expected = ApiError<GetLoggedDriverDataResponse>(
          message: 'Failed to fetch orders',
          failure: ServerFailure(errorMessage: 'Failed to fetch orders'),
        );

        provideDummy<ApiResult<GetLoggedDriverDataResponse>>(expected);
        when(repo.getLoggedDriverData()).thenAnswer((_) async => expected);

        // Act
        final actual = await useCase.invoke();

        // Assert
        verify(repo.getLoggedDriverData()).called(1);
        expect(actual, isA<ApiError<GetLoggedDriverDataResponse>>());
      },
    );
  });
}
