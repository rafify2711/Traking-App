import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/features/order_status/presentation/view/order_status_screen_body.dart';
import 'package:tracking_app/features/order_status/presentation/viewModel/order_status_view_model.dart';

class OrderStatusScreen extends StatelessWidget {
  const OrderStatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create:(context) => OrderStatusViewModel(),
        child: const OrderStatusScreenBody(),
    );
  }


}
