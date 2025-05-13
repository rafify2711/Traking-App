import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/api_manger/api_service.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/core/utils/Errors/error_handler.dart';
import 'package:tracking_app/features/home/data/data%20source/home_screen_data_source_imp.dart';
import 'package:tracking_app/features/home/data/models/pending_orders_response.dart';

import 'home_screen_data_source_imp_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  late ApiService apiService;
  late HomeScreenDataSourceImp dataSource;

  setUp(() {
    apiService = MockApiService();
    dataSource = HomeScreenDataSourceImp(apiService);
  });

  group('HomeScreenDataSourceImp', () {
    const page = 1;

    test(
      'should return ApiSuccess<OrderResponse> when getAllPendingOrders succeeds',
      () async {
        // Arrange
        final expectedResponse = OrderResponse();
        when(
          apiService.getAllPendingOrders(page),
        ).thenAnswer((_) async => expectedResponse);

        // Act
        final result = await dataSource.getAllPendingOrders(page);

        // Assert
        verify(apiService.getAllPendingOrders(page)).called(1);
        expect(result, isA<ApiSuccess<OrderResponse>>());
      },
    );

    test(
      'should return ApiError<OrderResponse> when getAllPendingOrders fails',
      () async {
        // Arrange
        when(
          apiService.getAllPendingOrders(page),
        ).thenThrow(ServerFailure(errorMessage: 'error'));

        // Act
        final result = await dataSource.getAllPendingOrders(page);

        // Assert
        verify(apiService.getAllPendingOrders(page)).called(1);
        expect(result, isA<ApiError<OrderResponse>>());
      },
    );
  });
}
