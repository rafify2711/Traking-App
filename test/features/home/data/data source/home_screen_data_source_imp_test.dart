import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/api_manger/api_service.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/core/utils/error_handler.dart';
import 'package:tracking_app/features/home/data/data%20source/home_screen_data_source_imp.dart';
import 'package:tracking_app/features/home/data/models/pending_orders_response.dart';

import '../../../auth/forget_password/data/data_source/forget_password_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  late ApiService apiService;
  late HomeScreenDataSourceImp dataSource;

  setUp(() {
    apiService = MockApiService();
    dataSource = HomeScreenDataSourceImp(apiService);
  });

  group('HomeScreenDataSourceImp', () {
    test(
      'should return ApiSuccess<OrderResponse> when getAllPendingOrders succeeds',
      () async {
        // Arrange
        final expectedResponse = OrderResponse();
        when(
          apiService.getAllPendingOrders(),
        ).thenAnswer((_) async => expectedResponse);

        // Act
        final result = await dataSource.getAllPendingOrders();

        // Assert
        verify(apiService.getAllPendingOrders()).called(1);
        expect(result, isA<ApiSuccess<OrderResponse>>());
      },
    );

    test(
      'should return ApiError<OrderResponse> when getAllPendingOrders fails',
      () async {
        // Arrange
        when(
          apiService.getAllPendingOrders(),
        ).thenThrow(ServerFailure(errorMessage: 'error'));

        // Act
        final result = await dataSource.getAllPendingOrders();

        // Assert
        verify(apiService.getAllPendingOrders()).called(1);
        expect(result, isA<ApiError<OrderResponse>>());
      },
    );
  });
}
