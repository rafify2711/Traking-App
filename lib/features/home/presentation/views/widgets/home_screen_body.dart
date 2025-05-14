import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/base/base_state.dart';
import 'package:tracking_app/core/di/di.dart';
import 'package:tracking_app/features/home/domain/use_case/get_all_pending_orders_use_case.dart';
import 'package:tracking_app/features/home/domain/use_case/start_order_use_case.dart';
import 'package:tracking_app/features/home/presentation/view%20model/orders_cubit.dart';
import 'package:tracking_app/features/home/presentation/views/widgets/flower_order_card.dart';
import 'package:tracking_app/features/orders/domain/use_case/save_order_to_firebase_use_case.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  final ScrollController _scrollController = ScrollController();
  late OrdersCubit _ordersCubit;

  @override
  void initState() {
    super.initState();
    _ordersCubit = OrdersCubit(
      getIt.get<GetAllPendingOrdersUseCase>() ,getIt.get<StartOrderUseCase>(),getIt.get<SaveOrderToFirebaseUseCase>(),
    );
    _ordersCubit.getAllPendingOrders();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 100) {
        _ordersCubit.loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _ordersCubit,
      child: BlocBuilder<GetAllPendingOrdersCubit, GetAllPendingOrdersState>(
        builder: (context, state) {
          final status = state.pendingOrdersState;
          final orders = state.allOrders ?? [];

          if (status is BaseLoading && orders.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (status is BaseError && orders.isEmpty) {
            return Center(child: Text(status.errorMessage ?? 'Unknown error'));
          }

          return ListView.builder(
            controller: _scrollController,
            itemCount: orders.length + 1,
            itemBuilder: (context, index) {
              if (index < orders.length) {
                return FlowerOrderCard(order: orders[index]);
              } else {
                final currentPage = state.currentPage;
                final totalPages = state.totalPages;

                if (currentPage < totalPages) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              }
            },
          );
        },
      ),
    );
  }
}
