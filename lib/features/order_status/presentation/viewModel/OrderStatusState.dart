import '../../../../core/utils/enums/order_status_enum.dart';

abstract class OrderStatusState {
  final OrderStatus status;
  final int step;
  const OrderStatusState(this.status,this.step);
}

class OrderStatusInitial extends OrderStatusState {
  OrderStatusInitial(OrderStatus status,int step) : super(status,step);
}

class OrderStatusLoading extends OrderStatusState {
  OrderStatusLoading(OrderStatus status, int step) : super(status, step);
}

class OrderStatusSuccess extends OrderStatusState {
  OrderStatusSuccess(OrderStatus status, int step) : super(status, step);
}

class OrderStatusFailure extends OrderStatusState {
  final String error;
  OrderStatusFailure(OrderStatus status, int step, this.error) : super(status, step);
}
