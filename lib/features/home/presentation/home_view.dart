import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/base/base_state.dart';
import 'package:tracking_app/core/di/di.dart';
import 'package:tracking_app/features/home/data/models/pending_orders_response.dart';
import 'package:tracking_app/features/home/domain/use_case/get_all_pending_orders_use_case.dart';
import 'package:tracking_app/features/home/domain/use_case/start_order_use_case.dart';
import 'package:tracking_app/features/home/presentation/view%20model/orders_cubit.dart';
import 'package:tracking_app/features/home/presentation/widgets/flower_order_card.dart';

import '../../orders/domain/use_case/save_order_to_firebase_use_case.dart';
import '../data/models/order_response.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              OrdersCubit(getIt.get<GetAllPendingOrdersUseCase>(),getIt.get<StartOrderUseCase>(),getIt.get<SaveOrderToFirebaseUseCase>())
                ..getAllPendingOrders(),
      child: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          final status = state.pendingOrdersState;

          if (status is BaseLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (status is BaseError) {
              return Center(child: Text(status.errorMessage??'Unknown error'),);
                        
          } else if (status is BaseSuccess<OrderResponse>) {
            final orders = state.orderResponse!.orders ?? [];

            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final flowerOrder = orders[index];
                return  FlowerOrderCard(order: flowerOrder); // Update to accept order
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}


