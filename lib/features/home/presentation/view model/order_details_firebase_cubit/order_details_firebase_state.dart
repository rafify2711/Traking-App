part of 'order_details_firebase_cubit.dart';

class OrderDetailsFirebaseState extends Equatable {
  const OrderDetailsFirebaseState({
    this.orderState,
    this.order,

    // this.errorMessage,
  });

  final BaseState? orderState;
  final OrderDetails? order;

  OrderDetailsFirebaseState copyWith({
    BaseState? orderState,
    OrderDetails? order,

    // String? errorMessage,
  }) {
    return OrderDetailsFirebaseState(
      orderState: orderState ?? this.orderState,
      order: order ?? this.order,
    );
  }

  @override
  List<Object?> get props => [orderState, order];
}
