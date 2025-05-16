import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/core/base/base_state.dart';
import 'package:tracking_app/features/auth/apply/data/models/apply_model/apply_response/driver.dart';
import 'package:tracking_app/features/home/data/models/pending_orders_response.dart';
import 'package:tracking_app/features/home/domain/use_case/get_all_pending_orders_use_case.dart';
import 'package:tracking_app/features/home/domain/use_case/start_order_use_case.dart';
import 'package:tracking_app/features/orders/data/model/orders_firebase_model.dart';
import 'package:tracking_app/features/orders/domain/use_case/save_order_to_firebase_use_case.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final GetAllPendingOrdersUseCase getAllPendingOrdersUseCase;
  final StartOrderUseCase startOrderUseCase;
  final SaveOrderToFirebaseUseCase saveOrderToFirebaseUseCase;

  OrdersCubit(
    this.getAllPendingOrdersUseCase,
    this.startOrderUseCase,
    this.saveOrderToFirebaseUseCase,
  ) : super(const OrdersState());

  // Future<void> getAllPendingOrders() async {
  //   emit(state.copyWith(pendingOrdersState: BaseLoading<OrderResponse>()));

  //   final result = await getAllPendingOrdersUseCase.invoke();

  //   if (result is ApiSuccess<OrderResponse>) {
  //     emit(
  //       state.copyWith(
  //         pendingOrdersState: BaseSuccess<OrderResponse>(data: result.data),
  //         orderResponse: result.data,
  //       ),
  //     );
  //   } else if (result is ApiError<OrderResponse>) {
  //     emit(
  //       state.copyWith(
  //         pendingOrdersState: BaseError<OrderResponse>(
  //           errorMessage: result.failure?.errorMessage ?? 'Unknown error',
  //         ),
  //       ),
  //     );
  //   }
  // }

  Future<bool> acceptOrder(String id) async {
    emit(
      state.copyWith(
        acceptOrderState: BaseLoading<PendingOrderResponse>(),
        acceptingOrderId: id,
      ),
    );

    final result = await startOrderUseCase.invoke(id);

    if (result is ApiSuccess<PendingOrderResponse>) {
      // Find the accepted order
      final acceptedOrder = state.orderResponse?.orders?.firstWhere(
        (order) => order.id == id,
      );

      if (acceptedOrder != null) {
        // Save to Firebase
        final firebaseOrder = OrdersFirebaseModel(
          order: acceptedOrder,
          driver: Driver(
            country: "Egypt",
            firstName: "Ranim",
            lastName: "afify",
            vehicleType: "Car",
            vehicleNumber: "ABC123",
            vehicleLicense: "123456789",
            nid: "29805251234567",
            nidImg: "https://example.com/nid.png",
            email: "ranim@example.com",
            gender: "Female",
            phone: "+201234567890",
            photo: "https://example.com/photo.jpg",
            role: "driver",
            id: "driver123",
            createdAt: DateTime.now(),
          ),
        );

        final firebaseResult = await saveOrderToFirebaseUseCase.invoke(
          firebaseOrder,
        );

        if (firebaseResult is ApiError) {
          emit(
            state.copyWith(
              acceptOrderState: BaseError<PendingOrderResponse>(
                errorMessage:
                    'Order accepted but failed to save to Firebase: ${firebaseResult.message ?? firebaseResult.failure?.errorMessage ?? "Unknown error"}',
              ),
              acceptingOrderId: null,
            ),
          );
          return false;
        }
      }

      // Update only the specific order in the list
      if (state.orderResponse != null) {
        final updatedOrders =
            state.orderResponse!.orders
                ?.where((order) => order.id != id)
                .toList() ??
            [];
        final updatedResponse = PendingOrderResponse(orders: updatedOrders);

        emit(
          state.copyWith(
            acceptOrderState: BaseSuccess<PendingOrderResponse>(data: result.data),
            orderResponse: updatedResponse,
            acceptingOrderId: null,
          ),
        );
      }
      return true;
    } else if (result is ApiError<PendingOrderResponse>) {
      emit(
        state.copyWith(
          acceptOrderState: BaseError<PendingOrderResponse>(
            errorMessage: result.failure?.errorMessage ?? 'Unknown error',
          ),
          acceptingOrderId: null,
        ),
      );
      return false;
    }
    return false;
  }

  void rejectOrder(String id) {
    if (state.orderResponse != null) {
      final updatedOrders =
          state.orderResponse!.orders
              ?.where((order) => order.id != id)
              .toList() ??
          [];
      final updatedResponse = PendingOrderResponse(orders: updatedOrders);

      emit(state.copyWith(orderResponse: updatedResponse));
    }
  }
}
