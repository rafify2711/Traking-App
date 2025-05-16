import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/core/utils/Errors/error_handler.dart';
import 'package:tracking_app/features/home/data/models/pending_orders_response.dart';
import 'package:tracking_app/features/home/domain/repo/home_screen_repo.dart';
import 'package:tracking_app/features/home/domain/use_case/get_all_pending_orders_use_case.dart';

import 'get_all_pending_orders_use_case_test.mocks.dart';

@GenerateMocks([HomeScreenRepo])
void main() {
  late HomeScreenRepo repo;
  late GetAllPendingOrdersUseCase useCase;

  setUp(() {
    repo = MockHomeScreenRepo();
    useCase = GetAllPendingOrdersUseCase(repo);
  });

  group('GetAllPendingOrdersUseCase', () {
    const page = 1;

    test(
      'should return ApiSuccess<OrderResponse> when repo returns success',
      () async {
        // Arrange
        final response = PendingOrderResponse(); // Mock data can be added here
        final expected = ApiSuccess<PendingOrderResponse>(data: response);

        provideDummy<ApiResult<PendingOrderResponse>>(expected);
        when(repo.getAllPendingOrders(page)).thenAnswer((_) async => expected);

        // Act
        final actual = await useCase.invoke(page);

        // Assert
        verify(repo.getAllPendingOrders(page)).called(1);
        expect(actual, isA<ApiSuccess<PendingOrderResponse>>());
      },
    );

    test(
      'should return ApiError<OrderResponse> when repo returns error',
      () async {
        // Arrange
        final expected = ApiError<PendingOrderResponse>(
          message: 'Failed to fetch orders',
          failure: ServerFailure(errorMessage: 'Failed to fetch orders'),
        );

        provideDummy<ApiResult<PendingOrderResponse>>(expected);
        when(repo.getAllPendingOrders(page)).thenAnswer((_) async => expected);

        // Act
        final actual = await useCase.invoke(page);

        // Assert
        verify(repo.getAllPendingOrders(page)).called(1);
        expect(actual, isA<ApiError<PendingOrderResponse>>());
      },
    );
  });
}
