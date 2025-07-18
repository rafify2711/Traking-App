import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/base/base_state.dart';
import 'package:tracking_app/core/config/routes_name.dart';
import 'package:tracking_app/core/utils/app_text_styles.dart';
import 'package:tracking_app/core/utils/services/get_responsive_height_and_width.dart';
import 'package:tracking_app/features/home/presentation/views/widgets/custom_card_widget.dart';
import 'package:tracking_app/features/order_tap/presentation/view_model/driver_order_cubit.dart';
import 'package:tracking_app/features/order_tap/presentation/view_model/driver_order_state.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

import '../../../../core/utils/colors.dart';

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
                return Center(
                  child: Text(status.errorMessage ?? 'Unknown error'),
                );
              } else if (status is BaseLoading) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: PalletsColors.mainColorBase,
                    ),
                  ),
                );
              } else {
                final driverOrderData = state.driverOrderData?.orders ?? [];
                return Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Spacer(flex: 1),
                          Container(
                            // margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.only(
                              right: 70,
                              top: 15,
                              bottom: 15,
                              left: 20,
                            ),
                            decoration: const BoxDecoration(
                              color: PalletsColors.lightPink,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${state.canceledCount}"),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.cancel_outlined,
                                      color: Colors.red,
                                    ),

                                    Text(LocaleKeys.canceled.tr()),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Spacer(flex: 5),
                          Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.only(
                              right: 70,
                              top: 15,
                              bottom: 15,
                              left: 20,
                            ),
                            decoration: const BoxDecoration(
                              color: PalletsColors.lightPink,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${state.completedCount}"),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.check_circle_outline,
                                      color: Colors.green,
                                    ),
                                    Text(LocaleKeys.completed.tr()),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Spacer(flex: 1),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          LocaleKeys.recentOrders.tr(),
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: ListView.builder(
                          itemCount: driverOrderData.length,
                          itemBuilder: (context, index) {
                            return Container(
                              // margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 4,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      LocaleKeys.flowerOrder.tr(),
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  driverOrderData[index].order!.state ==
                                          "canceled"
                                      ? Row(
                                        children: [
                                          const Icon(
                                            Icons.cancel_outlined,
                                            color: Colors.red,
                                          ),
                                          const SizedBox(width: 10),

                                          Text(
                                            driverOrderData[index]
                                                .order!
                                                .state!,
                                            style: const TextStyle(
                                              color: Colors.red,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      )
                                      : driverOrderData[index].order!.state ==
                                          "completed"
                                      ? Row(
                                        children: [
                                          const Icon(
                                            Icons.check_circle_outline,
                                            color: Colors.green,
                                          ),
                                          const SizedBox(width: 10),

                                          Text(
                                            driverOrderData[index]
                                                .order!
                                                .state!,
                                            style: const TextStyle(
                                              color: Colors.green,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      )
                                      : Row(
                                        children: [
                                          const Icon(
                                            Icons.circle_outlined,
                                            color: Colors.blue,
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            driverOrderData[index]
                                                .order!
                                                .state!,
                                            style: const TextStyle(
                                              color: Colors.blue,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: responsiveWidth(16),
                                    ),
                                    child: Text(
                                      LocaleKeys.pickUpAddress.tr(),
                                      style: AppTextStyles.instance.textStyle18
                                          .copyWith(
                                            color: PalletsColors.gray,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                  ),
                                  CustomCardWidget(
                                    withTrailing: true,
                                    title:
                                        "${driverOrderData[index].store?.name}",
                                    addressOrPriceText:
                                        "${driverOrderData[index].store?.address}",
                                    imagePath:
                                        "${driverOrderData[index].store?.image}",
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
                                      style: AppTextStyles.instance.textStyle18
                                          .copyWith(
                                            color: PalletsColors.gray,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                  ),
                                  CustomCardWidget(
                                    withTrailing: true,
                                    title:
                                        "${driverOrderData[index].order?.user?.firstName} ${driverOrderData[index].order?.user?.lastName}",
                                    addressOrPriceText:
                                        "20th st, Sheikh Zayed, Giza",
                                    imagePath:
                                        "${driverOrderData[index].order?.user?.photo}",
                                    numberOfOrder: "",
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        RoutesName.customerLocationScreen,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
