import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tracking_app/core/utils/app_text_styles.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';


class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 16, top: 8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Lottie.asset(
                    'assets/json/on_boarding.json',
                    fit: BoxFit.fill,
                  ),
                ),

                const SizedBox(height: 16),
                Text(
                  LocaleKeys.WelcomeToFloweryRiderApp.tr(),
                  style: AppTextStyles.instance.textStyle20.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    LocaleKeys.login.tr(),
                    style: AppTextStyles.instance.textStyle16.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    LocaleKeys.applyNow.tr(),
                    style: AppTextStyles.instance.textStyle16.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
