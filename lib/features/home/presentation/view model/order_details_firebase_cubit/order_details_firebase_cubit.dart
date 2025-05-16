import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tracking_app/core/base/base_state.dart';

import 'package:tracking_app/features/home/data/models/order_response.dart';
import 'package:tracking_app/features/home/domain/use_case/get_orderdetails_from_firebase.dart';

part 'order_details_firebase_state.dart';

class OrderDetailsFirebaseCubit extends Cubit<OrderDetailsFirebaseState> {
  final GetOrderdetailsFromFirebase orderUseCase;

  OrderDetailsFirebaseCubit(this.orderUseCase)
    : super(const OrderDetailsFirebaseState());

  Future<void> fetchOrderDetails() async {
    emit(state.copyWith(orderState: BaseLoading<OrderResponse>()));

    try {
      final result = await orderUseCase.invoke();
      emit(
        state.copyWith(
          orderState: BaseSuccess<OrderResponse>(data: result),
          order: result,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          orderState: BaseError<OrderResponse>(errorMessage: e.toString()),
        ),
      );
    }
  }
}
