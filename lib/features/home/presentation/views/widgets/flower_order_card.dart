import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/base/base_state.dart';
import 'package:tracking_app/core/config/routes_name.dart';
import 'package:tracking_app/core/utils/colors.dart';
import 'package:tracking_app/features/home/data/models/order_model.dart';
import 'package:tracking_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:tracking_app/features/home/presentation/views/widgets/flower_order_actions.dart';
import 'package:tracking_app/features/home/presentation/views/widgets/flower_order_address_section.dart';
import 'package:tracking_app/features/home/presentation/views/widgets/flower_order_card_header.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

class FlowerOrderCard extends StatelessWidget {
  final OrderModel order;
  const FlowerOrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final isAccepting = state.acceptOrderStatus is BaseLoading<void> &&
            state.currentOrderID == order.id;

        return Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                RoutesName.orderDetailsScreen,
                arguments: order,
              );
            },
            child: Card(
              color: PalletsColors.whiteBase,
              elevation: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const FlowerOrderCardHeader(),
                  FlowerOrderAddressSection(
                    label: LocaleKeys.pickUpAddress.tr(),
                    title: order.store?.name??'',
                    address: order.store?.address??'',
                    imagePath: order.store?.image??'',
                    orderNumber: order.orderNumber!,
                  ),
                  FlowerOrderAddressSection(
                    label: LocaleKeys.userAddress.tr(),
                    title: "${order.user?.firstName} ${order.user?.lastName}",
                    address: (order.shippingAddress != null)
                        ? "${order.shippingAddress?.street} ${order.shippingAddress?.city}"
                        : "No provided address",
                    imagePath: order.user?.photo??'',
                    orderNumber: order.orderNumber!,
                  ),
                  FlowerOrderActions(
                    order: order,
                    isAccepting: isAccepting,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

