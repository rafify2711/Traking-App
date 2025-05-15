import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/core/base/base_state.dart';
import 'package:tracking_app/features/home/data/models/order_details.dart';
import 'package:tracking_app/features/home/data/models/pending_orders_response.dart';
import 'package:tracking_app/features/home/domain/use_case/get_all_pending_orders_use_case.dart';

part 'get_all_pending_orders_state.dart';

class GetAllPendingOrdersCubit extends Cubit<GetAllPendingOrdersState> {
  final GetAllPendingOrdersUseCase useCase;

  GetAllPendingOrdersCubit(this.useCase)
    : super(const GetAllPendingOrdersState());

  Future<void> getAllPendingOrders({int page = 1}) async {
    emit(state.copyWith(pendingOrdersState: BaseLoading<OrderResponse>()));

    final result = await useCase.invoke(page);

    if (result is ApiSuccess<OrderResponse>) {
      final newOrders = result.data!.orders ?? [];
      final updatedOrders =
          page == 1 ? newOrders : [...state.allOrders, ...newOrders];

      emit(
        state.copyWith(
          pendingOrdersState: BaseSuccess<OrderResponse>(data: result.data),
          allOrders: updatedOrders,
          currentPage: result.data!.metadata?.currentPage ?? page,
          totalPages: result.data!.metadata?.totalPages ?? 1,
        ),
      );
    } else if (result is ApiError<OrderResponse>) {
      emit(
        state.copyWith(
          pendingOrdersState: BaseError<OrderResponse>(
            errorMessage: result.failure?.errorMessage ?? 'Unknown error',
          ),
        ),
      );
    }
  }

  Future<void> loadNextPage() async {
    if (state.currentPage < state.totalPages) {
      await getAllPendingOrders(page: state.currentPage + 1);
    }
  }
}
