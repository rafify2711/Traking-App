part of 'home_cubit.dart';

 class HomeState extends Equatable {
  final BaseState<PendingOrderResponse> pendingOrdersState;
  final List<OrderModel> allOrders;
  final int currentPage;
  final int totalPages;
  final String currentOrderID;
  final BaseState<void> acceptOrderStatus;

  const HomeState({
    this.pendingOrdersState = const BaseInitial<PendingOrderResponse>(),
    this.allOrders = const [],
    this.currentPage = 1,
    this.totalPages = 1,
    this.currentOrderID = '',
    this.acceptOrderStatus = const BaseInitial(),
  });

  HomeState copyWith({
    BaseState<PendingOrderResponse>? pendingOrdersState,
    List<OrderModel>? allOrders,
    int? currentPage,
    int? totalPages,
   BaseState<void>? acceptOrderStatus,
    String? currentOrderID,
  }) {
    return HomeState(
      pendingOrdersState: pendingOrdersState ?? this.pendingOrdersState,
      allOrders: allOrders ?? this.allOrders,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      currentOrderID: currentOrderID ?? this.currentOrderID,
      acceptOrderStatus: acceptOrderStatus ?? this.acceptOrderStatus,
    );
  }

  @override
  List<Object?> get props => [
    pendingOrdersState,
    allOrders,
    currentPage,
    totalPages,
    currentOrderID,
    acceptOrderStatus,
  ];
}

