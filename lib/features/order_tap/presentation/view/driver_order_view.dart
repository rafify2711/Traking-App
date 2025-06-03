import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/di/di.dart';
import 'package:tracking_app/features/order_tap/domain/use_case/get_driver_order_data_usecase.dart';
import 'package:tracking_app/features/order_tap/presentation/view/driver_order_screen.dart';
import 'package:tracking_app/features/order_tap/presentation/view_model/driver_order_cubit.dart';

class DriverOrderView extends StatelessWidget {
  final viewModel = DriverOrderCubit(
    getIt<GetDriverOrderDataUsecase>(),
  );
  DriverOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel..getDriverOrderData(),

      child: const DriverOrderScreen(),

    ); //Ma
  }
}