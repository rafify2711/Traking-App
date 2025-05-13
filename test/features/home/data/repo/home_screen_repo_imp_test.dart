import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/core/utils/Errors/error_handler.dart';
import 'package:tracking_app/features/home/data/data%20source/home_screen_data_source.dart';
import 'package:tracking_app/features/home/data/models/pending_orders_response.dart';
import 'package:tracking_app/features/home/data/repo/home_screen_repo_imp.dart';
import 'package:tracking_app/features/home/domain/repo/home_screen_repo.dart';

import 'home_screen_repo_imp_test.mocks.dart';

@GenerateMocks([HomeScreenDataSource])
void main() {
  late MockHomeScreenDataSource mockDataSource;
  late HomeScreenRepo repo;

  setUp(() {
    mockDataSource = MockHomeScreenDataSource();
    repo = HomeScreenRepoImp(mockDataSource);
  });

  group('HomeScreenRepoImp Tests', () {
    const page = 1;

    test(
      'should return ApiSuccess<OrderResponse> when getAllPendingOrders succeeds',
      () async {
        // arrange
        final response = OrderResponse(); // You can provide mock data here
        final expected = ApiSuccess<OrderResponse>(data: response);
        provideDummy<ApiResult<OrderResponse>>(expected);

        when(
          mockDataSource.getAllPendingOrders(page),
        ).thenAnswer((_) async => expected);

        // act
        final actual = await repo.getAllPendingOrders(page);

        // assert
        verify(mockDataSource.getAllPendingOrders(page)).called(1);
        expect(actual, expected);
      },
    );

    test(
      'should return ApiError<OrderResponse> when getAllPendingOrders fails',
      () async {
        // arrange
        final expected = ApiError<OrderResponse>(
          message: 'Network error',
          failure: ServerFailure(errorMessage: 'Network error'),
        );
        provideDummy<ApiResult<OrderResponse>>(expected);

        when(
          mockDataSource.getAllPendingOrders(page),
        ).thenAnswer((_) async => expected);

        // act
        final actual = await repo.getAllPendingOrders(page);

        // assert
        verify(mockDataSource.getAllPendingOrders(page)).called(1);
        expect(actual, expected);
      },
    );
  });
}
