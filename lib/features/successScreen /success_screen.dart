import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tracking_app/core/config/routes_name.dart';
import 'package:tracking_app/core/utils/app_text_styles.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 149, right: 30, left: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/check-circle.png", scale: 5),
              SizedBox(height: 24),
              Text(
                LocaleKeys.applicationSubmittedTitle.tr(),
                style: AppTextStyles.instance.textStyle18.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 16),
              Text(
                LocaleKeys.applicationSubmittedBody.tr(),
                style: AppTextStyles.instance.textStyle16,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 72),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.loginView);
                },
                child: Text(
                  LocaleKeys.login.tr(),
                  style: AppTextStyles.instance.textStyle16,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Image.asset("assets/images/bg.png"),
    );
  }
}
