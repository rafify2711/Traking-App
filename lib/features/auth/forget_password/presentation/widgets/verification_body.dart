import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:tracking_app/core/utils/app_text_styles.dart';
import 'package:tracking_app/core/utils/colors.dart';
import 'package:tracking_app/core/utils/services/get_responsive_height_and_width.dart';
import 'package:tracking_app/features/auth/forget_password/presentation/widgets/app_bar_section.dart';
import 'package:tracking_app/features/auth/forget_password/presentation/widgets/resend_code.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

class VerificationBody extends StatelessWidget {
  VerificationBody({super.key});
  final List<TextEditingController> controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  final List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());
  String otpCode() {
    return controllers.map((controller) => controller.text).join();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarSection(text: LocaleKeys.password.tr()),
      ),
      body: Center(
        child: Column(
          children: [
            responsiveHeightWidget(15),
            Text(
              LocaleKeys.emailVerification.tr(),
              style: AppTextStyles.instance.textStyle18.copyWith(
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            responsiveHeightWidget(15),
            Text(
              LocaleKeys.pleaseEnterYourCode.tr(),
              style: AppTextStyles.instance.textStyle14.copyWith(
                color: PalletsColors.gray,
              ),
              textAlign: TextAlign.center,
            ),
            responsiveHeightWidget(25),
            Pinput(
              length: 6,
              keyboardType: TextInputType.number,
              showCursor: true,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              autofocus: true,

              onCompleted: (value) {},
              defaultPinTheme: PinTheme(
                width: resposiveWidth(48),
                height: resposiveHeight(48),
                decoration: BoxDecoration(
                  color: PalletsColors.white60,
                  borderRadius: BorderRadius.circular(10),
                ),
                textStyle: AppTextStyles.instance.textStyle18.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            responsiveHeightWidget(20),
            ResendCode(),
          ],
        ),
      ),
    );
  }
}
