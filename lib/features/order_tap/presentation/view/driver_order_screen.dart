import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/base/base_state.dart';
import 'package:tracking_app/features/order_tap/presentation/view_model/driver_order_cubit.dart';
import 'package:tracking_app/features/order_tap/presentation/view_model/driver_order_state.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

import '../widgets/order_loading_widget.dart';
import '../widgets/order_error_widget.dart';
import '../widgets/order_content_widget.dart';

class DriverOrderScreen extends StatelessWidget {
  const DriverOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
          padding: const EdgeInsets.all(0),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(LocaleKeys.myOrders.tr()),
      ),
      body: Column(
        children: [
          BlocBuilder<DriverOrderCubit, DriverOrderState>(
            builder: (context, state) {
              final status = state.driverOrderState;

              if (status is BaseError) {
                return OrderErrorWidget(error: status);
              } else if (status is BaseLoading) {
                return const OrderLoadingWidget();
              } else {
                final driverOrderData = state.driverOrderData?.orders ?? [];
                return OrderContentWidget(
                  orders: driverOrderData,
                  canceledCount: "${state.canceledCount}",
                  completedCount: "${state.completedCount}",
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
