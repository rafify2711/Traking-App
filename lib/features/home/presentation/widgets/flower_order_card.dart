import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tracking_app/core/config/routes_name.dart';
import 'package:tracking_app/core/utils/app_text_styles.dart';
import 'package:tracking_app/core/utils/colors.dart';
import 'package:tracking_app/core/utils/services/get_responsive_height_and_width.dart';
import 'package:tracking_app/features/home/data/models/order_response.dart';
import 'package:tracking_app/features/home/presentation/widgets/custom_card_widget.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

class FlowerOrderCard extends StatelessWidget {
  final Order order;
  const FlowerOrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, RoutesName.OrderDetailsView);
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
                title: order.store!.name ?? 'Unnamed Store',
                addressOrPriceText: order.store!.address ?? 'Unknown address',
                imagePath:
                    order.store!.image ?? "assets/images/Flowery logo.png",
                numberOfOrder: order.orderNumber ?? "Unkown Number",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(LocaleKeys.userAddress.tr()),
              ),
              CustomCardWidget(
                withTrailing: false,
                title: order.user!.firstName ?? "No Name",
                addressOrPriceText: "20th st, Sheikh Zayed, Giza",
                imagePath: order.user!.photo ?? "assets/images/Photo.png",
                numberOfOrder: order.orderNumber ?? "Unkown Number",
              ),

              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      order.totalPrice.toString(),
                      style: AppTextStyles.instance.textStyle14.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: responsiveWidth(111),
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text(LocaleKeys.reject.tr()),
                      ),
                    ),
                    SizedBox(
                      width: responsiveWidth(111),
                      // flex: 1,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(LocaleKeys.accept.tr()),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
