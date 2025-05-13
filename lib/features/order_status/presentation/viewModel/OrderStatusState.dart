import '../../../../core/utils/enums/order_status_enum.dart';

abstract class OrderStatusState {
  final OrderStatus status;
  const OrderStatusState(this.status);
}

class OrderStatusInitial extends OrderStatusState {
  OrderStatusInitial() : super(OrderStatus.pending);
}

class OrderStatusLoading extends OrderStatusState {
  OrderStatusLoading(super.status);
}

class OrderStatusSuccess extends OrderStatusState {
  OrderStatusSuccess(super.status);
}

class OrderStatusFailure extends OrderStatusState {
  final String error;
  OrderStatusFailure(super.status, this.error);
}
