import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tracking_app/core/utils/app_text_styles.dart';
import 'package:tracking_app/core/utils/colors.dart';
import 'package:tracking_app/core/utils/services/get_responsive_height_and_width.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 128, right: 16, left: 16),
        child: Center(
          child: Column(
            children: [
              Image.asset("assets/images/Frame 1000003483.png", scale: 4),
              responsiveHeightWidget(24),
              Text(
                LocaleKeys.thankYou.tr(),
                style: AppTextStyles.instance.textStyle24.copyWith(
                  fontWeight: FontWeight.bold,
                  color: PalletsColors.success,
                ),
                textAlign: TextAlign.center,
              ),
              responsiveHeightWidget(16),
              Text(
                LocaleKeys.orderDeliveredSuccess.tr(),
                style: AppTextStyles.instance.textStyle24,
                textAlign: TextAlign.center,
              ),
              responsiveHeightWidget(48),
              SizedBox(
                width: 343,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    LocaleKeys.done.tr(),
                    style: AppTextStyles.instance.textStyle16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
