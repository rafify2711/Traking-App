part of 'orders_cubit.dart';

class OrdersState extends Equatable {
  final BaseState? pendingOrdersState;
  final BaseState? acceptOrderState;
  final PendingOrderResponse? orderResponse;
  final GetLoggedDriverDataResponse? driverResponse;
  final String? acceptingOrderId;

  const OrdersState({
    this.driverResponse,
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
    GetLoggedDriverDataResponse? driverResponse,
  }) {
    return OrdersState(
      pendingOrdersState: pendingOrdersState ?? this.pendingOrdersState,
      acceptOrderState: acceptOrderState ?? this.acceptOrderState,
      orderResponse: orderResponse ?? this.orderResponse,
      acceptingOrderId: acceptingOrderId ?? this.acceptingOrderId,
      driverResponse: driverResponse ?? this.driverResponse,
    );
  }

  @override
  List<Object?> get props => [
    driverResponse,
    pendingOrdersState,
    acceptOrderState,
    orderResponse,
    acceptingOrderId,
  ];
}
