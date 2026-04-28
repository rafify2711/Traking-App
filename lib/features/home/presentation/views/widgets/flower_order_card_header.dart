import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tracking_app/core/utils/app_text_styles.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

class FlowerOrderCardHeader extends StatelessWidget {
  const FlowerOrderCardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        left: 16,
        bottom: 16,
      ),
      child: Text(
        LocaleKeys.flowerorder.tr(),
        style: AppTextStyles.instance.textStyle14.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
