import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tracking_app/core/utils/app_text_styles.dart';
import 'package:tracking_app/core/utils/colors.dart';
import 'package:tracking_app/features/home/presentation/views/widgets/home_screen_body.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.floweryrider.tr(),
          style: AppTextStyles.instance.textStyle20.copyWith(
            color: PalletsColors.mainColorBase,
          ),
        ),
      ),
      body: const HomeScreenBody(),
    );
  }
}
