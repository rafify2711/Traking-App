// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracking_app/core/utils/app_text_styles.dart';
import 'package:tracking_app/core/utils/colors.dart';
import 'package:tracking_app/features/auth/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

class ResendCode extends StatefulWidget {
  const ResendCode({super.key});

  @override
  State<ResendCode> createState() => _ResendCodeState();
}

class _ResendCodeState extends State<ResendCode> {
  int remainingSeconds = 30;
  bool canResend = true;
  late Timer timer;

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void startTimer() {
    remainingSeconds = 30;
    canResend = false;
    setState(() {});
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        remainingSeconds--;

        setState(() {});
      } else {
        setState(() {
          canResend = true;
        });
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              LocaleKeys.didntReceiveTheCode.tr(),
              style: AppTextStyles.instance.textStyle16,
            ),
            GestureDetector(
              onTap:
                  canResend
                      ? () {
                        final cubit = context.read<ForgetPasswordCubit>();
                        cubit.forgetPassword();
                        startTimer();
                      }
                      : null,
              child: Text(
                LocaleKeys.resend.tr(),
                style: TextStyle(
                  color: canResend ? PalletsColors.mainColorBase : Colors.grey,
                  fontSize: AppTextStyles.instance.textStyle16.fontSize,
                  decoration: TextDecoration.underline,
                  decorationColor:
                      canResend ? PalletsColors.mainColorBase : Colors.grey,
                ),
              ),
            ),
          ],
        ),
        if (!canResend)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Resend code in $remainingSeconds seconds',
              style: AppTextStyles.instance.textStyle16.copyWith(
                color: Colors.grey,
              ),
            ),
          ),
      ],
    );
  }
}
