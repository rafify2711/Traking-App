part of 'orders_cubit.dart';

class OrdersState extends Equatable {
  final BaseState? pendingOrdersState;
  final BaseState? acceptOrderState;
  final PendingOrderResponse? orderResponse;
  final String? acceptingOrderId;

  const OrdersState({
    this.pendingOrdersState,
    this.acceptOrderState,
    this.orderResponse,
    this.acceptingOrderId,
  });

  OrdersState copyWith({
    BaseState? pendingOrdersState,
    BaseState? acceptOrderState,
    PendingOrderResponse? orderResponse,
    String? acceptingOrderId,
  }) {
    return OrdersState(
      pendingOrdersState: pendingOrdersState ?? this.pendingOrdersState,
      acceptOrderState: acceptOrderState ?? this.acceptOrderState,
      orderResponse: orderResponse ?? this.orderResponse,
      acceptingOrderId: acceptingOrderId ?? this.acceptingOrderId,
    );
  }

  @override
  List<Object?> get props => [
    pendingOrdersState,
    acceptOrderState,
    orderResponse,
    acceptingOrderId,
  ];
}
