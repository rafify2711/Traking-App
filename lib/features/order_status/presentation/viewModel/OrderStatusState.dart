import '../../../../core/utils/enums/order_status_enum.dart';

abstract class OrderStatusState {
  final OrderStatus status;
  final int step;
  const OrderStatusState(this.status,this.step);
}

class OrderStatusInitial extends OrderStatusState {
  OrderStatusInitial(super.status,super.step);
}

class OrderStatusLoading extends OrderStatusState {
  OrderStatusLoading(super.status, super.step);
}

class OrderStatusSuccess extends OrderStatusState {
  OrderStatusSuccess(super.status, super.step);
}

class OrderStatusFailure extends OrderStatusState {
  final String error;
  OrderStatusFailure(super.status, super.step, this.error);
}
