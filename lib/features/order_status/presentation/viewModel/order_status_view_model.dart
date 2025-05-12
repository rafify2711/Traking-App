import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/features/order_status/domain/use_case/update_order-status_use_case.dart';
import '../../../../core/utils/enums/order_status_enum.dart';
import 'OrderStatusState.dart';

class OrderStatusViewModel extends Cubit<OrderStatusState> {

  final UpdateOrderStatusUseCase updateOrderStatusCase;
  OrderStatusViewModel(this.updateOrderStatusCase) : super(OrderStatusInitial()); // Initial state is 'pending' from the enum i've created

  //function that updates the state whenever the button is pressed
  void updateStatus(String orderId) async {
    final currentStatus = state.status;
    final nextStatus = getNextStatus(currentStatus);
    emit(OrderStatusLoading(currentStatus));
    try {
      await updateOrderStatusCase.callToFirebase(orderId, nextStatus);
      // Map to the 4 valid values for the external API
      final apiCompatibleStatus = mapToApiStatus(nextStatus);
      await updateOrderStatusCase.callToApi(orderId, apiCompatibleStatus);
      emit(OrderStatusSuccess(nextStatus));
    } catch (e) {
      emit(OrderStatusFailure(currentStatus, e.toString()));
    }
  }

  String mapToApiStatus(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return 'pending';
      case OrderStatus.inProgress:
      case OrderStatus.arrivedAtPickup:
      case OrderStatus.picked:
      case OrderStatus.startDeliver:
      case OrderStatus.outForDelivery:
      case OrderStatus.arrivedToUser:
        return 'inProgress';
      case OrderStatus.delivered:
        return 'completed';
      default:
        return 'canceled'; // You can customize fallback handling here
    }
  }

  OrderStatus getNextStatus(OrderStatus current) {
    switch (current) {
      case OrderStatus.pending:
        return OrderStatus.inProgress;
      case OrderStatus.inProgress:
        return OrderStatus.arrivedAtPickup;
      case OrderStatus.arrivedAtPickup:
        return OrderStatus.picked;
      case OrderStatus.picked:
        return OrderStatus.startDeliver;
      case OrderStatus.startDeliver:
        return OrderStatus.outForDelivery;
      case OrderStatus.outForDelivery:
        return OrderStatus.arrivedToUser;
      case OrderStatus.arrivedToUser:
        return OrderStatus.delivered;
      case OrderStatus.delivered:
        return OrderStatus.delivered;
    }
  }
  //ill use this to compare the state and return it to the text inside the button
  String getButtonText(OrderStatus state) {
    switch (state) {
      case OrderStatus.pending:
        return 'Accept';
      case OrderStatus.inProgress:
        return 'Arrived at Pickup Location';
      case OrderStatus.arrivedAtPickup:
        return 'Picked';
      case OrderStatus.picked:
        return 'Start Deliver';
      case OrderStatus.startDeliver:
        return 'Out for Delivery';
      case OrderStatus.outForDelivery:
        return 'Arrived to User';
      case OrderStatus.arrivedToUser:
        return 'Delivered to User';
      case OrderStatus.delivered:
        return 'Delivered';
      default:
        return 'Unknown Status';
    }
  }

  //ill use this to compare the state and return it to the text inside the appbar
  String getAppBarTitle(OrderStatus state) {
    switch (state) {
      case OrderStatus.pending:
        return 'Pending';
      case OrderStatus.inProgress:
        return 'Accepted';
      case OrderStatus.arrivedAtPickup:
        return 'Arrived at Pickup';
      case OrderStatus.picked:
        return 'Picked';
      case OrderStatus.startDeliver:
        return 'Start Deliver';
      case OrderStatus.outForDelivery:
        return 'Out for Delivery';
      case OrderStatus.arrivedToUser:
        return 'Arrived to User';
      case OrderStatus.delivered:
        return 'Delivered';
      default:
        return 'Unknown';
    }
  }
}
