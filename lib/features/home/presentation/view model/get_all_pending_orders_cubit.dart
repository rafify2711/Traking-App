import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/core/base/base_state.dart';
import 'package:tracking_app/features/home/data/models/pending_orders_response.dart';
import 'package:tracking_app/features/home/domain/use_case/get_all_pending_orders_use_case.dart';

part 'get_all_pending_orders_state.dart';

class GetAllPendingOrdersCubit extends Cubit<GetAllPendingOrdersState> {
  final GetAllPendingOrdersUseCase useCase;

  GetAllPendingOrdersCubit(this.useCase)
    : super(const GetAllPendingOrdersState());

  Future<void> getAllPendingOrders() async {
    emit(state.copyWith(pendingOrdersState: BaseLoading<OrderResponse>()));

    final result = await useCase.invoke();

    if (result is ApiSuccess<OrderResponse>) {
      emit(
        state.copyWith(
          pendingOrdersState: BaseSuccess<OrderResponse>(data: result.data),
          orderResponse: result.data,
        ),
      );
    } else if (result is ApiError<OrderResponse>) {
      emit(
        state.copyWith(
          pendingOrdersState: BaseError<OrderResponse>(
            result.message ?? 'Unknown error',
          ),
        ),
      );
    }
  }
}
