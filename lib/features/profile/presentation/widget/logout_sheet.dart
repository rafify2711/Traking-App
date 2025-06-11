import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tracking_app/core/utils/app_text_styles.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

void showLogoutDialog(BuildContext context, VoidCallback onPressed) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title:  Center(
          child: Text(
            LocaleKeys.LOGOUT.tr(),
            style: AppTextStyles.instance.textStyle18.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        content:  Text(
          LocaleKeys.logoutConfirmation.tr(),
          style:  AppTextStyles.instance.textStyle16,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 10),
        actionsPadding: const EdgeInsets.only(bottom: 16),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 100,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                
                  child:  Text(LocaleKeys.cancel.tr(), style: AppTextStyles.instance.textStyle14),
                ),
              ),
              const SizedBox(width: 12), 
              SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: onPressed,
                
                  
                  child:  Text(LocaleKeys.logout.tr(), style: AppTextStyles.instance.textStyle14),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
