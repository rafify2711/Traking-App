import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/base/base_state.dart';
import 'package:tracking_app/core/config/routes_name.dart';
import 'package:tracking_app/core/utils/app_text_styles.dart';
import 'package:tracking_app/core/utils/colors.dart';
import 'package:tracking_app/core/utils/services/get_responsive_height_and_width.dart';
import 'package:tracking_app/features/home/data/models/order_details.dart';
import 'package:tracking_app/features/home/presentation/views/order_details_view.dart';
import 'package:tracking_app/features/home/data/models/pending_orders_response.dart';
import 'package:tracking_app/features/home/presentation/view model/orders_cubit.dart';
import 'package:tracking_app/features/home/presentation/views/widgets/custom_card_widget.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';
import 'package:tracking_app/core/utils/helper_func/snack_bar.dart';



class FlowerOrderCard extends StatelessWidget {
  final OrderDetails order;
  const FlowerOrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        final acceptState = state.acceptOrderState;
        final isAccepting = state.acceptingOrderId == order.id;
        final acceptError = acceptState is BaseError<OrderResponse> && state.acceptingOrderId == order.id
            ? acceptState.errorMessage 
            : null;


        final isRemoved = state.orderResponse?.orders?.contains(order) == false;

        if (isRemoved) {
          return const SizedBox.shrink(); // Hide the card if order was accepted or rejected
        }

        return Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return OrderDetailsView(order: order,);
          },));
            },
            child: Card(
              color: PalletsColors.whiteBase,
              elevation: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16, left: 16, bottom: 16),
                    child: Text(
                      LocaleKeys.flowerorder.tr(),
                      style: AppTextStyles.instance.textStyle14.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, bottom: 8),
                    child: Text(LocaleKeys.pickUpAddress.tr()),
                  ),
                  CustomCardWidget(
                    withTrailing: false,
                    title: order.store!.name!,
                    addressOrPriceText: order.store!.address!,
                    imagePath: order.store!.image!,
                    numberOfOrder: order.orderNumber!,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(LocaleKeys.userAddress.tr()),
                  ),
                  CustomCardWidget(
                    withTrailing: false,
                    title: "${order.user!.firstName} ${order.user!.lastName}",
                    addressOrPriceText: (order.shippingAddress!=null)? "${order.shippingAddress!.street} ${order.shippingAddress!.city}":"No provided address",
                    imagePath: order.user!.photo!,
                    numberOfOrder: order.orderNumber!,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          order.totalPrice!.toString(),
                          style: AppTextStyles.instance.textStyle14.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          width: responsiveWidth(111),
                          child: OutlinedButton(
                            onPressed: () {
                              context.read<OrdersCubit>().rejectOrder(order.id!);
                              showSnackBar(context, "order rejected");
                            },
                            child: Text(LocaleKeys.reject.tr()),
                          ),
                        ),
                        SizedBox(
                          width: responsiveWidth(111),
                          child: ElevatedButton(
                            onPressed: isAccepting 
                                ? null 
                                : () async {
                                    final success = await context.read<OrdersCubit>().acceptOrder(order.id!);
                                    if (success) {
                                      showSnackBar(context, "order accepted");
                                    } else {
                                      showErrorSnackBar(context, "order failed to accept");
                                    }
                                  },
                            child: isAccepting
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                    ),
                                  )
                                : Text(LocaleKeys.accept.tr()),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (acceptError != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        acceptError,
                        style: AppTextStyles.instance.textStyle12.copyWith(
                          color: Colors.red,
                        ),
                      ),
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
