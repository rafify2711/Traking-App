import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/di/di.dart';
import 'package:tracking_app/features/home/presentation/views/order_details_screen_body.dart';
import 'package:tracking_app/features/order_status/domain/use_case/update_order-status_use_case.dart';
import 'package:tracking_app/features/order_status/presentation/viewModel/order_status_view_model.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderStatusViewModel(getIt.get<UpdateOrderStatusUseCase>() ),
      child: const OrderDetailsScreenBody(),
    );
  }
}
