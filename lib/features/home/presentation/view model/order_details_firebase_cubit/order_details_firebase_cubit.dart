import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tracking_app/core/base/base_state.dart';
import 'package:tracking_app/features/home/data/models/order_details.dart';
import 'package:tracking_app/features/home/domain/use_case/get_all_pending_orders_use_case.dart';
import 'package:tracking_app/features/home/domain/use_case/get_orderdetails_from_firebase.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

part 'order_details_firebase_state.dart';

class OrderDetailsFirebaseCubit extends Cubit<OrderDetailsFirebaseState> {
  final GetOrderdetailsFromFirebase orderUseCase;

  OrderDetailsFirebaseCubit( this.orderUseCase)
    : super(const OrderDetailsFirebaseState());

  Future<void> fetchOrderDetails() async {
    emit(state.copyWith(orderState: BaseLoading<OrderDetails>()));

    try{
      final result = await orderUseCase.invoke();
print(result.totalPrice);
print("aaaaaaaa");
      emit(state.copyWith(orderState: BaseSuccess<OrderDetails>(data: result),order: result));

    }catch(e){
      print(e);
      print("eeeeeeeeeeeee");
      emit(
        state.copyWith(
          orderState: BaseError<OrderDetails>(errorMessage: e.toString()),
        ),
      );


    }
  }
}
