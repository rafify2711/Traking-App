import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:tracking_app/core/utils/app_text_styles.dart';
import 'package:tracking_app/core/utils/colors.dart';
import 'package:tracking_app/features/home/presentation/widgets/custom_card_widget.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

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
                padding: const EdgeInsets.only(left: 16),
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
                title: "Flowe Store",
                addressOrPriceText: "20th st, Sheikh Zayed, Giza ",
                imagePath: "assets/images/Flowery logo.png",
                numberOfOrder: "",
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
                title: "Flowe Store",
                addressOrPriceText: "20th st, Sheikh Zayed, Giza ",
                imagePath: "assets/images/Photo.png",
                numberOfOrder: "",
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
              CustomCardWidget(
                withTrailing: false,
                title: "20th st, Sheikh Zayed, Giza ",
                addressOrPriceText: "EGP 2222",
                imagePath: "assets/images/image 2.png",
                numberOfOrder: "x1",
              ),
              CustomCardWidget(
                withTrailing: false,
                title: "20th st, Sheikh Zayed, Giza ",
                addressOrPriceText: "EGP 2222",
                imagePath: "assets/images/image 2.png",
                numberOfOrder: "x1",
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
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(LocaleKeys.arrivedAtPickupPoint.tr()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
