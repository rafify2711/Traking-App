import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/base/base_state.dart';
import 'package:tracking_app/core/di/di.dart';
import 'package:tracking_app/features/home/data/models/pending_orders_response.dart';
import 'package:tracking_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:tracking_app/features/home/presentation/views/widgets/flower_order_card.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getAllPendingOrders();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 100) {
        context.read<HomeCubit>().loadNextPage();
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
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final status = state.pendingOrdersState;
        final orders = state.allOrders;

        if (status is BaseLoading<PendingOrderResponse> && orders.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        // Show error if no orders and error occurred
        if (status is BaseError<PendingOrderResponse> && orders.isEmpty) {
          return Center(child: Text(status.errorMessage ?? 'Unknown error'));
        }

        if (status is BaseSuccess<PendingOrderResponse>) {
          return ListView.builder(
            controller: _scrollController,
            itemCount:
                orders.length + (state.currentPage < state.totalPages ? 1 : 0),
            itemBuilder: (context, index) {
              if (index < orders.length) {
                return FlowerOrderCard(order: orders[index]);
              } else {
                // Only reached if there are more pages to load
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
