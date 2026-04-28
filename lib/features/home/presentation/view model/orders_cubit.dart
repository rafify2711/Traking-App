// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:tracking_app/core/base/base_state.dart';
// import 'package:tracking_app/features/home/data/models/pending_orders_response.dart';
// import 'package:tracking_app/features/home/domain/use_case/get_all_pending_orders_use_case.dart';
// import 'package:tracking_app/features/home/domain/use_case/accept_order_use_case.dart';
// import 'package:tracking_app/features/orders/domain/use_case/save_order_to_firebase_use_case.dart';
// import 'package:tracking_app/features/profile/data/model/get_logged_driver_data_response.dart';

// part 'orders_state.dart';

// class OrdersCubit extends Cubit<OrdersState> {
//   final GetAllPendingOrdersUseCase getAllPendingOrdersUseCase;
//   final AcceptOrderUseCase startOrderUseCase;
//   final SaveOrderToFirebaseUseCase saveOrderToFirebaseUseCase;

//   OrdersCubit(
//     this.getAllPendingOrdersUseCase,
//     this.startOrderUseCase,
//     this.saveOrderToFirebaseUseCase,
//   ) : super(const OrdersState());



//   Future<void > acceptOrder(String id) async {
//   // 
// }}
