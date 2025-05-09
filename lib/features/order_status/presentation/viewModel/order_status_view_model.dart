import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/order_status_enum.dart';

class OrderStatusViewModel extends Cubit<OrderStatus> {

  OrderStatusViewModel() : super(OrderStatus.pending); // Initial state is 'pending' from the enum i've created

  //function that updates the state whenever the button is pressed
  void updateStatus() {
    switch (state) {
      case OrderStatus.pending:
        emit(OrderStatus.accepted);
        break;
      case OrderStatus.accepted:
        emit(OrderStatus.arrivedAtPickup);
        break;
      case OrderStatus.arrivedAtPickup:
        emit(OrderStatus.picked);
        break;
      case OrderStatus.picked:
       emit(OrderStatus.startDeliver);
        break;
      case OrderStatus.startDeliver:
        emit(OrderStatus.outForDelivery);
        break;
      case OrderStatus.outForDelivery:
        emit(OrderStatus.arrivedToUser);
        break;
      case OrderStatus.arrivedToUser:
        emit(OrderStatus.delivered);
        break;
      case OrderStatus.delivered:
        emit(OrderStatus.delivered); // Button is unpressable, stays in 'delivered' state
        break;
    }
  }
  //ill use this to compare the state and return it to the text inside the button
  String getButtonText(OrderStatus state) {
    switch (state) {
      case OrderStatus.pending:
        return 'Accept';
      case OrderStatus.accepted:
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
      case OrderStatus.accepted:
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
