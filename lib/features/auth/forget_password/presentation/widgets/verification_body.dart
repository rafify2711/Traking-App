// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:tracking_app/core/base/base_state.dart';
import 'package:tracking_app/core/config/routes_name.dart';
import 'package:tracking_app/core/utils/app_text_styles.dart';
import 'package:tracking_app/core/utils/colors.dart';
import 'package:tracking_app/core/utils/helper_func/snack_bar.dart';
import 'package:tracking_app/core/utils/services/get_responsive_height_and_width.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/request/otp_request.dart';
import 'package:tracking_app/features/auth/forget_password/presentation/cubit/verify_code_cubit.dart';
import 'package:tracking_app/features/auth/forget_password/presentation/widgets/app_bar_section.dart';
import 'package:tracking_app/features/auth/forget_password/presentation/widgets/resend_code.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

class VerificationBody extends StatelessWidget {
  const VerificationBody({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
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
            BlocConsumer<VerifyCodeCubit, VerifyCodeState>(
              listener: (context, state) {
                if (state.verifyCodeState is BaseError) {
                  showErrorSnackBar(
                    context,
                  (state.verifyCodeState as BaseError).errorMessage ?? '',
                  );
                }
                if (state.verifyCodeState is BaseSuccess) {
                  showSnackBar(context, 'Success');
                  Navigator.pushNamed(
                    context,
                    RoutesName.resetPasswordScreen,
                    arguments: email,
                  );
                }
              },
              builder: (context, state) {
                return Pinput(
                  length: 6,
                  keyboardType: TextInputType.number,
                  showCursor: true,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  autofocus: true,
                  controller: context.read<VerifyCodeCubit>().otpController,
                  onCompleted: (value) {
                    context.read<VerifyCodeCubit>().sendVerifyCode(
                      OtpRequest(resetCode: value),
                    );
                  },
                  defaultPinTheme: PinTheme(
                    width: responsiveWidth(48),
                    height: resposiveHeight(48),

                    decoration: BoxDecoration(
                      color: PalletsColors.white60,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    textStyle: AppTextStyles.instance.textStyle18.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              },
            ),
            responsiveHeightWidget(20),
            const ResendCode(),
          ],
        ),
      ),
    );
  }
}
