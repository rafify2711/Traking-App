import 'package:flutter/material.dart';
import 'package:tracking_app/core/config/routes_name.dart';
import 'package:tracking_app/core/utils/app_text_styles.dart';
import 'package:tracking_app/core/utils/colors.dart';
import 'package:tracking_app/core/utils/services/get_responsive_height_and_width.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

class SucessTrackOrder extends StatelessWidget {
  const SucessTrackOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [
          const Spacer(),
          Image.asset('assets/images/sucess.png'),
          const Spacer(),
          Text(
        '',
            // LocaleKeys.yourOrderPlacedSuccessfully.tr(),
            textAlign: TextAlign.center,
            style: AppTextStyles.instance.textStyle24.copyWith(
              color: PalletsColors.blackBase,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: responsiveWidth(30)),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.success);
              },
              child: Text('',
                // LocaleKeys.trackOrder.tr(),
                style: AppTextStyles.instance.textStyle16.copyWith(
                  color: PalletsColors.whiteBase,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          const Spacer(flex: 6),
        ],
      ),
    );
  }
}
