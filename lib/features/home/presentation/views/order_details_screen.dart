import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/di/di.dart';
import 'package:tracking_app/features/home/data/models/order_response.dart';
import 'package:tracking_app/features/home/domain/use_case/get_orderdetails_from_firebase.dart';
import 'package:tracking_app/features/home/presentation/view%20model/order_details_firebase_cubit/order_details_firebase_cubit.dart';
import 'package:tracking_app/features/home/presentation/views/order_details_screen_body.dart';
import 'package:tracking_app/features/order_status/domain/use_case/update_order-status_use_case.dart';
import 'package:tracking_app/features/order_status/presentation/viewModel/order_status_view_model.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)?.settings.arguments as OrderResponse;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  OrderStatusViewModel(getIt.get<UpdateOrderStatusUseCase>()),
        ),
        BlocProvider(
          create:
              (context) => OrderDetailsFirebaseCubit(
                getIt.get<GetOrderdetailsFromFirebase>(),
              )..fetchOrderDetails(),
        ),
      ],
      child: OrderDetailsScreenBody(order: arg),
    );
  }
}
