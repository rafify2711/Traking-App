import 'package:flutter/material.dart';
import 'package:tracking_app/core/utils/app_text_styles.dart';
import 'package:tracking_app/core/utils/colors.dart';
import 'package:tracking_app/core/utils/services/get_responsive_height_and_width.dart';

class WelcomeTextInApplyView extends StatelessWidget {
  const WelcomeTextInApplyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome!!',
          style: AppTextStyles.instance.textStyle20.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: responsiveHeight(8)),
        Text(
          'You want to be a delivery man?',
          style: AppTextStyles.instance.textStyle16.copyWith(
            fontWeight: FontWeight.w500,
            color: PalletsColors.white90,
          ),
        ),
        Text(
          'Join our team',
          style: AppTextStyles.instance.textStyle16.copyWith(
            fontWeight: FontWeight.w500,
            color: PalletsColors.white90,
          ),
        ),
      ],
    );
  }
}
