import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tracking_app/core/config/routes_name.dart';
import 'package:tracking_app/core/utils/app_text_styles.dart';
import 'package:tracking_app/core/utils/services/get_responsive_height_and_width.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset("assets/images/bg.png", fit: BoxFit.cover),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: responsiveWidth(30),
                  vertical: responsiveHeight(140),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/check-circle.png", scale: 4),
                    responsiveHeightWidget(24),
                    Text(
                      LocaleKeys.applicationSubmittedTitle.tr(),
                      style: AppTextStyles.instance.textStyle18.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    responsiveHeightWidget(16),
                    Text(
                      LocaleKeys.applicationSubmittedBody.tr(),
                      style: AppTextStyles.instance.textStyle16,
                      textAlign: TextAlign.center,
                    ),
                    responsiveHeightWidget(48),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RoutesName.loginScreen);
                        },
                        child: Text(
                          LocaleKeys.login.tr(),
                          style: AppTextStyles.instance.textStyle16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
