import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/base/base_state.dart';
import 'package:tracking_app/core/config/routes_name.dart';
import 'package:tracking_app/core/di/di.dart';

import 'package:tracking_app/core/utils/app_text_styles.dart';
import 'package:tracking_app/core/utils/colors.dart';
import 'package:tracking_app/core/utils/services/get_responsive_height_and_width.dart';
import 'package:tracking_app/core/utils/validator.dart';
import 'package:tracking_app/core/utils/widgets/custom_text_form_fieled.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/request/forget_password_request.dart';
import 'package:tracking_app/features/auth/forget_password/domain/use_cases/forget_password_use_case.dart';
import 'package:tracking_app/features/auth/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:tracking_app/features/auth/forget_password/presentation/widgets/app_bar_section.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

class ForgetPasswordBody extends StatelessWidget {
  ForgetPasswordBody({super.key});
  ForgetPasswordCubit forgetPasswordCubit = ForgetPasswordCubit(
    getIt<ForgetPasswordUseCase>(),
  );
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
            responsiveHeightWidget(10),
            Text(
              LocaleKeys.forgetPassword.tr(),
              style: AppTextStyles.instance.textStyle18.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            responsiveHeightWidget(10),
            Text(
              LocaleKeys.pleaseEnterYourEmailAssociatedToYourAccount.tr(),
              style: AppTextStyles.instance.textStyle14.copyWith(
                color: PalletsColors.gray,
              ),
              textAlign: TextAlign.center,
            ),
            responsiveHeightWidget(20),
            Form(
              key: forgetPasswordCubit.formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: resposiveHeight(15),
                      vertical: resposiveWidth(10),
                    ),
                    child: CustomTextFormFieled(
                      hintText: LocaleKeys.enterYourEmail.tr(),
                      labelText: LocaleKeys.email.tr(),
                      textEditingController:
                          forgetPasswordCubit.forgetPasswordController,
                      isObsecureText: false,
                      validator: Validator.validateEmail,
                    ),
                  ),
                  responsiveHeightWidget(10),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: resposiveHeight(15),
                      vertical: resposiveWidth(10),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        forgetPasswordCubit.forgetPassword(
                          ForgetPasswordRequest(
                            email:
                                forgetPasswordCubit
                                    .forgetPasswordController
                                    .text,
                          ),
                          context,
                        );
                      },
                      child: Text(
                        LocaleKeys.confirm.tr(),
                        style: AppTextStyles.instance.textStyle16.copyWith(
                          color: PalletsColors.white10,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
