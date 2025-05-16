import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/core/base/base_state.dart';

import 'package:tracking_app/features/home/data/models/pending_orders_response.dart';
import 'package:tracking_app/features/home/domain/use_case/get_all_pending_orders_use_case.dart';
import 'package:tracking_app/features/home/presentation/view%20model/pending_orders_cubit/get_all_pending_orders_state.dart';

class GetAllPendingOrdersCubit extends Cubit<GetAllPendingOrdersState> {
  GetAllPendingOrdersUseCase useCase;
  GetAllPendingOrdersCubit(this.useCase)
    : super(const GetAllPendingOrdersState());

  Future<void> getAllPendingOrders({int page = 1}) async {
    emit(state.copyWith(pendingOrdersState: BaseLoading<PendingOrderResponse>()));

    final result = await useCase.invoke(page);

    if (result is ApiSuccess<PendingOrderResponse>) {
      final newOrders = result.data!.orders ?? [];
      final updatedOrders =
          page == 1 ? newOrders : [...state.allOrders, ...newOrders];

      emit(
        state.copyWith(
          pendingOrdersState: BaseSuccess<PendingOrderResponse>(data: result.data),
          allOrders: updatedOrders,
          currentPage: result.data!.metadata?.currentPage ?? page,
          totalPages: result.data!.metadata?.totalPages ?? 1,
        ),
      );
    } else if (result is ApiError<PendingOrderResponse>) {
      emit(
        state.copyWith(
          pendingOrdersState: BaseError<PendingOrderResponse>(
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
