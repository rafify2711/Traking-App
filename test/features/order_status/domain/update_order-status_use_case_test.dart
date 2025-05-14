import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/core/utils/enums/order_status_enum.dart';
import 'package:tracking_app/features/order_status/domain/repo/order_repo.dart';
import 'package:tracking_app/features/order_status/domain/use_case/update_order-status_use_case.dart';

import 'update_order-status_use_case_test.mocks.dart';


@GenerateMocks([OrderRepository])
void main() {
  late MockOrderRepository mockOrderRepository;
  late UpdateOrderStatusUseCase useCase;
  provideDummy<ApiResult<String>>(const ApiSuccess<String>(data: 'dummy'));

  setUp(() {
    mockOrderRepository = MockOrderRepository();
    useCase = UpdateOrderStatusUseCase(mockOrderRepository);
  });

  /// Group 1: Firebase Call
  group('callToFirebase', () {
    test(
      'should call updateOrderStatusToFireBase with correct values',
          () async {
        // Arrange
        const orderId = 'order123';
        const status = OrderStatus.inProgress;

        when(mockOrderRepository.updateOrderStatusToFireBase(orderId, status))
            .thenAnswer((_) async {});

        // Act
        await useCase.callToFirebase(orderId, status);

        // Assert
        verify(mockOrderRepository.updateOrderStatusToFireBase(orderId, status)).called(1);
      },
    );
  });

  /// Group 2: API Call
  group('callToApi', () {
    const orderId = 'order123';
    const newStatus = 'inProgress';

    test('should return ApiSuccess when updateOrderStatusToApi succeeds', () async {
      // Arrange
      when(mockOrderRepository.updateOrderStatusToApi(orderId, newStatus))
          .thenAnswer((_) async => const ApiSuccess<String>(data: 'Status updated'));

      // Act
      await useCase.callToApi(orderId, newStatus);

      // Assert
      verify(mockOrderRepository.updateOrderStatusToApi(orderId, newStatus)).called(1);
    });

    test('should return ApiError when updateOrderStatusToApi fails', () async {
      // Arrange
      when(mockOrderRepository.updateOrderStatusToApi(orderId, newStatus))
          .thenAnswer((_) async => const ApiError<String>(message: 'Something went wrong'));

      // Act
     await useCase.callToApi(orderId, newStatus);

      // Assert
      verify(mockOrderRepository.updateOrderStatusToApi(orderId, newStatus)).called(1);
    });
  });
}
