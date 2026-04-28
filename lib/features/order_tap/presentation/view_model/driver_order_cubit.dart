import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/core/base/base_state.dart';
import 'package:tracking_app/features/order_tap/data/model/driver_orders_response.dart';
import 'package:tracking_app/features/order_tap/domain/use_case/get_driver_order_data_usecase.dart';
import 'package:tracking_app/features/order_tap/presentation/view_model/driver_order_state.dart';

class DriverOrderCubit extends Cubit<DriverOrderState> {
  final GetDriverOrderDataUsecase getDriverOrderDataUsecase;


  DriverOrderCubit(this.getDriverOrderDataUsecase)
    : super(const DriverOrderState());

  Future<void> getDriverOrderData() async {
    emit(state.copyWith(driverOrderState: BaseLoading<DriverOrdersResponse>()));

    final result = await getDriverOrderDataUsecase.invoke();
    switch (result) {
      case ApiSuccess<DriverOrdersResponse>():
        {
          final data = result.data;
          final orders = data?.orders ?? [];

          int canceled = 0;
          int completed = 0;

          for (var item in orders) {
            final orderState = item.order?.state;
            if (orderState == 'canceled') {
              canceled++;
            } else if (orderState == 'completed') {
              completed++;
            }
          }
          emit(
            state.copyWith(
              driverOrderState: BaseSuccess<DriverOrdersResponse>(
                data: result.data,

              ),
              canceledCount: canceled,
              completedCount: completed,
              driverOrderData: result.data,
            ),
          );

          break;
        }
      case ApiError<DriverOrdersResponse>():
        {
          log(result.failure!.errorMessage.toString());
          emit(
            state.copyWith(
              driverOrderState: BaseError<DriverOrdersResponse>(
                errorMessage: result.failure?.errorMessage ?? 'Unknown error',
              ),
            ),
          );
        }
    }
  }

}
