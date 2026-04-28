import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/core/base/base_state.dart';
import 'package:tracking_app/core/utils/flowery_driver_method_helper.dart';
import 'package:tracking_app/features/home/data/data%20source/home_screen_data_source_imp.dart';
import 'package:tracking_app/features/home/data/models/order_model.dart';
import 'package:tracking_app/features/home/data/models/order_response.dart';
import 'package:tracking_app/features/home/data/models/pending_orders_response.dart';
import 'package:tracking_app/features/home/domain/use_case/accept_order_use_case.dart';
import 'package:tracking_app/features/home/domain/use_case/get_all_pending_orders_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetAllPendingOrdersUseCase useCase;
  final AcceptOrderUseCase _acceptOrderUseCase;
  HomeCubit(this.useCase, this._acceptOrderUseCase) : super(const HomeState());

  Future<void> getAllPendingOrders({int page = 1}) async {
    emit(
      state.copyWith(pendingOrdersState: const BaseLoading<PendingOrderResponse>()),
    );

    final result = await useCase.invoke(page);

    if (result is ApiSuccess<PendingOrderResponse>) {
      final newOrders = result.data!.orders ?? [];
      final updatedOrders =
          page == 1 ? newOrders : [...state.allOrders, ...newOrders];

      emit(
        state.copyWith(
          pendingOrdersState: BaseSuccess<PendingOrderResponse>(
            data: result.data,
          ),
          allOrders: updatedOrders,
          currentPage: result.data!.metadata?.currentPage ?? page,
          totalPages: result.data!.metadata?.totalPages ?? 1,
        ),
      );
      log('Fetched ${newOrders.length} orders. Total orders: ${updatedOrders.length}');
    } else if (result is ApiError<PendingOrderResponse>) {
      emit(
        state.copyWith(
          pendingOrdersState: BaseError<PendingOrderResponse>(
            errorMessage: result.failure?.errorMessage ?? 'Unknown error',
          ),
        ),
      );
      log('Error occurred while fetching orders. Error: ${result.failure?.errorMessage ?? "Unknown error"}');
    }
  }

  Future<void> loadNextPage() async {
    if (state.currentPage < state.totalPages) {
      await getAllPendingOrders(page: state.currentPage + 1);
    }
  }

  Future<void> acceptOrder({required AcceptOrderRequestEntity request}) async {
    emit(
      state.copyWith(
        acceptOrderStatus: const BaseLoading<void>(),
        currentOrderID: request.orderId,
      ),
    );
    final result = await _acceptOrderUseCase.invoke(request: request);
    if (isClosed) return;
    switch (result) {
      case ApiSuccess<void>():
        FloweryDriverMethodHelper.currentDriverOrderId = request.orderId;
        emit(
          state.copyWith(
            acceptOrderStatus: const BaseSuccess<void>(data: null),
            currentOrderID: "",
          ),
        );
        emit(state.copyWith(acceptOrderStatus: const BaseInitial()));
        break;
      case ApiError<void>():
        emit(
          state.copyWith(
            acceptOrderStatus: BaseError<void>(
              errorMessage: result.failure?.errorMessage ?? 'Unknown error',
            ),
            currentOrderID: "",
          ),
        );
        emit(state.copyWith(acceptOrderStatus: const BaseInitial()));
        break;
    }
  }

  void rejectOrder({required String orderId}) {
    emit(state.copyWith(pendingOrdersState: const BaseLoading()));
    state.allOrders.removeWhere((order) => order.id == orderId);
emit(state.copyWith(pendingOrdersState: const BaseSuccess()));
  }
}
