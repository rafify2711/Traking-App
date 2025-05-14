part of 'get_all_pending_orders_cubit.dart';

class GetAllPendingOrdersState extends Equatable {
  final BaseState? pendingOrdersState;
  final List<Order> allOrders;
  final int currentPage;
  final int totalPages;

  const GetAllPendingOrdersState({
    this.pendingOrdersState,
    this.allOrders = const [],
    this.currentPage = 1,
    this.totalPages = 1,
  });

  GetAllPendingOrdersState copyWith({
    BaseState? pendingOrdersState,
    List<Order>? allOrders,
    int? currentPage,
    int? totalPages,
  }) {
    return GetAllPendingOrdersState(
      pendingOrdersState: pendingOrdersState ?? this.pendingOrdersState,
      allOrders: allOrders ?? this.allOrders,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
    );
  }

  @override
  List<Object?> get props => [
    pendingOrdersState,
    allOrders,
    currentPage,
    totalPages,
  ];
}
