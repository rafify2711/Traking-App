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
    test(
      'should return ApiSuccess<OrderResponse> when repo returns success',
      () async {
        final response = OrderResponse(); // Add mock values if needed
        final expected = ApiSuccess<OrderResponse>(data: response);

        provideDummy<ApiResult<OrderResponse>>(expected);
        when(repo.getAllPendingOrders()).thenAnswer((_) async => expected);

        final actual = await useCase.invoke();

        verify(repo.getAllPendingOrders()).called(1);
        expect(actual, isA<ApiSuccess<OrderResponse>>());
      },
    );

    test(
      'should return ApiError<OrderResponse> when repo returns error',
      () async {
        final expected = ApiError<OrderResponse>(
          message: 'Failed to fetch orders',
          failure: ServerFailure(errorMessage: 'Failed to fetch orders'),
        );

        provideDummy<ApiResult<OrderResponse>>(expected);
        when(repo.getAllPendingOrders()).thenAnswer((_) async => expected);

        final actual = await useCase.invoke();

        verify(repo.getAllPendingOrders()).called(1);
        expect(actual, isA<ApiError<OrderResponse>>());
      },
    );
  });
}
