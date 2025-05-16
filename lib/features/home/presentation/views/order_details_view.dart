import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:tracking_app/core/base/base_state.dart';
import 'package:tracking_app/core/config/routes_name.dart';
import 'package:tracking_app/core/di/di.dart';
import 'package:tracking_app/core/utils/app_text_styles.dart';
import 'package:tracking_app/core/utils/colors.dart';
import 'package:tracking_app/core/utils/services/get_responsive_height_and_width.dart';

import 'package:tracking_app/features/home/data/models/order_response.dart';
import 'package:tracking_app/features/home/domain/use_case/get_orderdetails_from_firebase.dart';
import 'package:tracking_app/features/home/presentation/view%20model/order_details_firebase_cubit/order_details_firebase_cubit.dart';
import 'package:tracking_app/features/home/presentation/views/widgets/custom_card_widget.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

class OrderDetailsView extends StatefulWidget {
  final OrderResponse? order;

  const OrderDetailsView({super.key, this.order});

  @override
  State<OrderDetailsView> createState() => _OrderDetailsViewState();
}

class _OrderDetailsViewState extends State<OrderDetailsView> {
  late OrderDetailsFirebaseCubit _orderDetailsCubit;

  @override
  void initState() {
    super.initState();
    _orderDetailsCubit = OrderDetailsFirebaseCubit(
      getIt.get<GetOrderdetailsFromFirebase>(),
    );
    _orderDetailsCubit.fetchOrderDetails();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _orderDetailsCubit,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: PalletsColors.whiteBase,
          appBar: AppBar(title: Text(LocaleKeys.orderdetails.tr())),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const StepProgressIndicator(
                  totalSteps: 5,
                  currentStep: 3,
                  selectedColor: PalletsColors.success,
                  unselectedColor: PalletsColors.white80,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    color: PalletsColors.lightPink,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "${LocaleKeys.status.tr()} : ${LocaleKeys.accept.tr()}",
                          style: AppTextStyles.instance.textStyle16.copyWith(
                            color: PalletsColors.success,
                          ),
                        ),
                        Text(
                          "${LocaleKeys.orderId.tr()}: # 123456",
                          style: AppTextStyles.instance.textStyle16.copyWith(
                            color: PalletsColors.blackBase,
                          ),
                        ),
                        Text(
                          "Wed, 03 Sep 2024, 11:00 AM ",
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
                  title: widget.order?.store!.name ?? "Flowe Store",
                  addressOrPriceText:
                      widget.order?.store!.address ??
                      "20th st, Sheikh Zayed, Giza ",
                  imagePath:
                      widget.order?.store!.image ??
                      "assets/images/Flowery logo.png",
                  numberOfOrder: "",
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RoutesName.pickupLocationScreen,
                    );
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
                  title: widget.order?.user!.firstName ?? "Flowe Store",
                  addressOrPriceText: "20th st, Sheikh Zayed, Giza ",
                  imagePath:
                      // widget.order?.user!.photo ??
                      //     "assets/images/Photo.png",
                  "https://th.bing.com/th/id/OIP.9uQeXJPOGm7x6d4fFhnXxAHaD4?rs=1&pid=ImgDetMain",
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
                BlocBuilder<
                  OrderDetailsFirebaseCubit,
                  OrderDetailsFirebaseState
                >(
                  builder: (context, state) {
                    final status = state.orderState;
                    final orders = state.order;

                    if (status is BaseLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                   else if (status is BaseError ) {
                      return Center(
                        child: Text(status.errorMessage ?? 'Unknown error'),
                      );
                    }
else{
                      return Column(
                        children: [
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: orders?.orderItems?.length,
                            itemBuilder: (context, index) {
                              return CustomCardWidget(
                                withTrailing: false,
                                title:
                                orders?.orderItems?[index].product?.title ??
                                    "15 Red roses ",
                                addressOrPriceText:
                                orders?.orderItems?[index].price.toString() ??
                                    "EGP 2222",
                                imagePath:
                                // orders
                                //     ?.orderItems?[index]
                                //     .product!
                                //     .imgCover ??
                                    "https://th.bing.com/th/id/OIP.9uQeXJPOGm7x6d4fFhnXxAHaD4?rs=1&pid=ImgDetMain",

                                numberOfOrder:
                                orders?.orderItems![index].quantity
                                    .toString() ??
                                    "x1",
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
                                      orders?.totalPrice.toString() ?? "1000 EGP",
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
                                      orders?.paymentType ??
                                          LocaleKeys.cachOnDelivery.tr(),
                                      style: AppTextStyles.instance.textStyle14
                                          .copyWith(color: PalletsColors.gray),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(LocaleKeys.arrivedAtPickupPoint.tr()),
                            ),
                          ),
                        ],
                      );
                    }

                  },
                ),
                responsiveHeightWidget(16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
