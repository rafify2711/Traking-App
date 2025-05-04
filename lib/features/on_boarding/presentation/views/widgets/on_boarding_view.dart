import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(LocaleKeys.welcomeToFloweryRiderApp.tr())),
    );
  }
}
