import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/features/order_status/domain/order_status_enum.dart';
import 'package:tracking_app/features/order_status/presentation/viewModel/order_status_view_model.dart';

class OrderStatusScreenBody extends StatelessWidget {
  const OrderStatusScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<OrderStatusViewModel,OrderStatus>(
          builder: (context, state) {
            return Text(context.read<OrderStatusViewModel>().getAppBarTitle(state));
          },
        ),
      ),
      body: Center(
        child: BlocBuilder<OrderStatusViewModel, OrderStatus>(
          builder: (context, state) {
            return ElevatedButton(
              onPressed: state == OrderStatus.delivered
                  ? null // Disable button when delivered
                  : () {
                context.read<OrderStatusViewModel>().updateStatus();
              },
              child: Text(context.read<OrderStatusViewModel>().getButtonText(state)),
            );
          },
        ),
      ),
    );
  }

 
}
