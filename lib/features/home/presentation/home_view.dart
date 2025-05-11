import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/base/base_state.dart';
import 'package:tracking_app/core/di/di.dart';
import 'package:tracking_app/core/utils/colors.dart';
import 'package:tracking_app/features/home/data/models/pending_orders_response.dart';
import 'package:tracking_app/features/home/domain/use_case/get_all_pending_orders_use_case.dart';
import 'package:tracking_app/features/home/presentation/view%20model/get_all_pending_orders_cubit.dart';
import 'package:tracking_app/features/home/presentation/widgets/flower_order_card.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              GetAllPendingOrdersCubit(getIt.get<GetAllPendingOrdersUseCase>())
                ..getAllPendingOrders(),
      child: BlocBuilder<GetAllPendingOrdersCubit, GetAllPendingOrdersState>(
        builder: (context, state) {
          final status = state.pendingOrdersState;

          if (status is BaseLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (status is BaseError) {
            return Center(child: Text("error"));
          } else if (status is BaseSuccess<OrderResponse>) {
            final orders = state.orderResponse!.orders ?? [];

            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return FlowerOrderCard(); // Update to accept order
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
