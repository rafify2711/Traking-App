part of 'get_all_pending_orders_cubit.dart';

class GetAllPendingOrdersState extends Equatable {
  final BaseState? pendingOrdersState;
  final OrderResponse? orderResponse;

  const GetAllPendingOrdersState({this.pendingOrdersState, this.orderResponse});

  GetAllPendingOrdersState copyWith({
    BaseState? pendingOrdersState,
    OrderResponse? orderResponse,
  }) {
    return GetAllPendingOrdersState(
      pendingOrdersState: pendingOrdersState ?? this.pendingOrdersState,
      orderResponse: orderResponse ?? this.orderResponse,
    );
  }

  @override
  List<Object?> get props => [pendingOrdersState, orderResponse];
}
