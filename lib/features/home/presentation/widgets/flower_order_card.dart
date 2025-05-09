import 'package:flutter/material.dart';
import 'package:tracking_app/core/utils/app_text_styles.dart';
import 'package:tracking_app/core/utils/colors.dart';
import 'package:tracking_app/features/home/presentation/widgets/pick_up_address_widget.dart';
import 'package:tracking_app/features/home/presentation/widgets/user_address_widget.dart';

class FlowerOrderCard extends StatelessWidget {
  const FlowerOrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Card(
        color: PalletsColors.whiteBase,
        elevation: 7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, bottom: 16),
              child: Text(
                "Flower order",
                style: AppTextStyles.instance.textStyle14.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 8),
              child: Text("Pickup address"),
            ),
            PickUpAddressWidget(),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text("User address"),
            ),
            UserAddressWidget(),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "EGP 2000",
                    style: AppTextStyles.instance.textStyle14.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 111,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text("Reject"),
                    ),
                  ),
                  SizedBox(
                    width: 111,
                    // flex: 1,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Accept"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
