import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:tracking_app/core/utils/helper_func/snack_bar.dart';
import 'package:tracking_app/features/home/data/models/order_response.dart';
import 'package:tracking_app/features/home/presentation/views/widgets/custom_card_widget.dart';

import '../../../../core/config/routes_name.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/enums/order_status_enum.dart';
import '../../../../core/utils/services/get_responsive_height_and_width.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../order_status/presentation/viewModel/OrderStatusState.dart';
import '../../../order_status/presentation/viewModel/order_status_view_model.dart';

class OrderDetailsScreenBody extends StatefulWidget {
  const OrderDetailsScreenBody({super.key, required this.order});
  final OrderResponse order;
  @override
  State<OrderDetailsScreenBody> createState() => _OrderDetailsScreenBodyState();
}

class _OrderDetailsScreenBodyState extends State<OrderDetailsScreenBody> {
  // Define a constant for the order ID
  static const String orderId = "681bd6741433a666c8da31c7";

  @override
  void initState() {
    super.initState();
    // Initialize order status when the widget is first created
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<OrderStatusViewModel>().initializeOrderStatus(
        widget.order.id ?? "",
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: PalletsColors.whiteBase,
        appBar: AppBar(title: Text(LocaleKeys.orderdetails.tr())),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocConsumer<OrderStatusViewModel, OrderStatusState>(
                listener: (context, state) {
                  if (state is OrderStatusSuccess) {
                    showSnackBar(
                      context,
                      LocaleKeys.statusUpdatedSuccessfully.tr(),
                    );
                    log(widget.order.id.toString());
                  } else if (state is OrderStatusFailure) {
                    showSnackBar(context, state.error);
                    log(state.error);
                  }
                },
                builder: (context, state) {
                  return StepProgressIndicator(
                    totalSteps: 7,
                    currentStep: state.step,
                    selectedColor: PalletsColors.success,
                    unselectedColor: PalletsColors.white80,
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  color: PalletsColors.lightPink,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      BlocBuilder<OrderStatusViewModel, OrderStatusState>(
                        builder: (context, state) {
                          final title = context
                              .read<OrderStatusViewModel>()
                              .getAppBarTitle(state.status);
                          return Text(
                            title,
                            style: AppTextStyles.instance.textStyle16.copyWith(
                              color: PalletsColors.success,
                            ),
                          );
                        },
                      ),
                      Text(
                        "${LocaleKeys.orderId.tr()}: ${widget.order.id}",
                        style: AppTextStyles.instance.textStyle16.copyWith(
                          color: PalletsColors.blackBase,
                        ),
                      ),
                      Text(
                        "${widget.order.createdAt}",
                        style: AppTextStyles.instance.textStyle16.copyWith(
                          color: PalletsColors.gray,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: responsiveWidth(16)),
                child: Text(
                  LocaleKeys.pickUpAddress.tr(),
                  style: AppTextStyles.instance.textStyle18.copyWith(
                    color: PalletsColors.blackBase,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              CustomCardWidget(
                withTrailing: true,
                title: "${widget.order.store?.name}",
                addressOrPriceText: "${widget.order.store?.address}",
                imagePath: "${widget.order.store?.image}",
                numberOfOrder: "",
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.pickupLocationScreen);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  LocaleKeys.userAddress.tr(),
                  style: AppTextStyles.instance.textStyle18.copyWith(
                    color: PalletsColors.blackBase,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              CustomCardWidget(
                withTrailing: true,
                title:
                    "${widget.order.user?.firstName} ${widget.order.user?.lastName}",
                addressOrPriceText: "20th st, Sheikh Zayed, Giza",
                imagePath: "${widget.order.user?.photo}",
                numberOfOrder: "",
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RoutesName.customerLocationScreen,
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  LocaleKeys.orderdetails.tr(),
                  style: AppTextStyles.instance.textStyle18.copyWith(
                    color: PalletsColors.blackBase,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Column(
                children: [
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.order.orderItems?.length,
                    itemBuilder: (context, index) {
                      return CustomCardWidget(
                        withTrailing: false,
                        title:
                            widget.order.orderItems?[index].product?.title ??
                            "Red roses,15 Pink Rose Bouquet",
                        addressOrPriceText:
                            "EGP ${widget.order.orderItems?[index].price}",
                        imagePath:
                            // orders
                            //     ?.orderItems?[index]
                            //     .product!
                            //     .imgCover ??
                            "https://th.bing.com/th/id/OIP.9uQeXJPOGm7x6d4fFhnXxAHaD4?rs=1&pid=ImgDetMain",

                        numberOfOrder:
                            widget.order.orderItems![index].quantity.toString(),
                      );
                    },
                  ),

                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Card(
                      color: PalletsColors.whiteBase,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Text(
                              LocaleKeys.total.tr(),
                              style: AppTextStyles.instance.textStyle16
                                  .copyWith(
                                    color: PalletsColors.blackBase,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const Spacer(),
                            Text(
                              widget.order.totalPrice.toString(),
                              style: AppTextStyles.instance.textStyle14
                                  .copyWith(color: PalletsColors.gray),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Card(
                      color: PalletsColors.whiteBase,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Text(
                              LocaleKeys.paymentMethod.tr(),
                              style: AppTextStyles.instance.textStyle16
                                  .copyWith(
                                    color: PalletsColors.blackBase,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const Spacer(),
                            Text(
                              widget.order.paymentType ??
                                  LocaleKeys.cachOnDelivery.tr(),
                              style: AppTextStyles.instance.textStyle14
                                  .copyWith(color: PalletsColors.gray),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(4),
                child: Card(
                  color: PalletsColors.whiteBase,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Text(
                          LocaleKeys.paymentMethod.tr(),
                          style: AppTextStyles.instance.textStyle16.copyWith(
                            color: PalletsColors.blackBase,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          LocaleKeys.cachOnDelivery.tr(),
                          style: AppTextStyles.instance.textStyle14.copyWith(
                            color: PalletsColors.gray,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: BlocBuilder<OrderStatusViewModel, OrderStatusState>(
                  builder: (context, state) {
                    final viewModel = context.read<OrderStatusViewModel>();
                    final isDelivered = state.status == OrderStatus.delivered;
                    final isLoading = state is OrderStatusLoading;

                    return ElevatedButton(
                      onPressed:
                          isDelivered || isLoading
                              ? null
                              : () => viewModel.updateStatus(
                                orderId,
                                // widget.order.id ?? "",
                              ),
                      child:
                          isLoading
                              ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                              : Text(viewModel.getButtonText(state.status)),
                    );
                  },
                ),
              ),
              responsiveHeightWidget(16),
            ],
          ),
        ),
      ),
    );
  }
}
