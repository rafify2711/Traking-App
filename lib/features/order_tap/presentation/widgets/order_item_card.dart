import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tracking_app/core/config/routes_name.dart';
import 'package:tracking_app/core/utils/app_text_styles.dart';
import 'package:tracking_app/core/utils/services/get_responsive_height_and_width.dart';
import 'package:tracking_app/features/home/presentation/views/widgets/custom_card_widget.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';
import 'order_status_indicator.dart';

class OrderItemCard extends StatelessWidget {
  final String? orderState;
  final String? storeName;
  final String? storeAddress;
  final String? storeImage;
  final String? userFirstName;
  final String? userLastName;
  final String? userPhoto;

  const OrderItemCard({
    super.key,
    this.orderState,
    this.storeName,
    this.storeAddress,
    this.storeImage,
    this.userFirstName,
    this.userLastName,
    this.userPhoto,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
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
              LocaleKeys.flowerOrders.tr(),
              style: const TextStyle(fontSize: 18),
            ),
          ),
          if (orderState != null) ...[
            OrderStatusIndicator(status: orderState!),
          ],
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(
              left: responsiveWidth(16),
            ),
            child: Text(
              LocaleKeys.pickUpAddress.tr(),
              style: AppTextStyles.instance.textStyle18.copyWith(
                color: const Color(0xFF9E9E9E),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          CustomCardWidget(
            withTrailing: true,
            title: storeName ?? "",
            addressOrPriceText: storeAddress ?? "",
            imagePath: storeImage ?? "",
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
                color: const Color(0xFF9E9E9E),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          CustomCardWidget(
            withTrailing: true,
            title: "$userFirstName $userLastName",
            addressOrPriceText: "20th st, Sheikh Zayed, Giza",
            imagePath: userPhoto ?? "",
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
  }
}
