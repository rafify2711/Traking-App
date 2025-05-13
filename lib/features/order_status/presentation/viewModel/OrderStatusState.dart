import '../../../../core/utils/enums/order_status_enum.dart';

abstract class OrderStatusState {
  final OrderStatus status;
  const OrderStatusState(this.status);
}

class OrderStatusInitial extends OrderStatusState {
  OrderStatusInitial() : super(OrderStatus.pending);
}

class OrderStatusLoading extends OrderStatusState {
  OrderStatusLoading(OrderStatus status) : super(status);
}

class OrderStatusSuccess extends OrderStatusState {
  OrderStatusSuccess(OrderStatus status) : super(status);
}

class OrderStatusFailure extends OrderStatusState {
  final String error;
  OrderStatusFailure(OrderStatus status, this.error) : super(status);
}
