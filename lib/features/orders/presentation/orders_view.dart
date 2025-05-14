import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/features/home/presentation/views/order_details_screen.dart';

import '../../../core/di/di.dart';
import '../../order_status/domain/use_case/update_order-status_use_case.dart';
import '../../order_status/presentation/viewModel/order_status_view_model.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          OrderStatusViewModel(getIt.get<UpdateOrderStatusUseCase>()),
      child: const OrderDetailsScreen(),
    );
  }
}