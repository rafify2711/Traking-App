import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:tracking_app/core/utils/app_text_styles.dart';
import 'package:tracking_app/core/utils/colors.dart';
import 'package:tracking_app/features/home/presentation/widgets/order_details_widget.dart';
import 'package:tracking_app/features/home/presentation/widgets/pick_up_address_widget.dart';
import 'package:tracking_app/features/home/presentation/widgets/user_address_widget.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: PalletsColors.whiteBase,
        appBar: AppBar(title: const Text("Order Details")),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StepProgressIndicator(
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
                        "Status : Accepted ",
                        style: AppTextStyles.instance.textStyle16.copyWith(
                          color: PalletsColors.success,
                        ),
                      ),
                      Text(
                        "Order ID : # 123456",
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
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  "Pickup address",
                  style: AppTextStyles.instance.textStyle18.copyWith(
                    color: PalletsColors.blackBase,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              PickUpAddressWidget(withTrailing: true),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  "User address",
                  style: AppTextStyles.instance.textStyle18.copyWith(
                    color: PalletsColors.blackBase,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              UserAddressWidget(withTrailing: true),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  "Order details",
                  style: AppTextStyles.instance.textStyle18.copyWith(
                    color: PalletsColors.blackBase,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const OrderDetailsWidget(),
              const OrderDetailsWidget(),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Card(
                  color: PalletsColors.whiteBase,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Text(
                          "Total",
                          style: AppTextStyles.instance.textStyle16.copyWith(
                            color: PalletsColors.blackBase,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "EGP 111",
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
                padding: const EdgeInsets.all(4),
                child: Card(
                  color: PalletsColors.whiteBase,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Text(
                          "Payment method",
                          style: AppTextStyles.instance.textStyle16.copyWith(
                            color: PalletsColors.blackBase,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "Cash on delivery",
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
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Arrived at Pickup point"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
