import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/base/base_state.dart';
import 'package:tracking_app/core/config/routes_name.dart';
import 'package:tracking_app/core/utils/app_text_styles.dart';
import 'package:tracking_app/core/utils/colors.dart';
import 'package:tracking_app/core/utils/helper_func/snack_bar.dart';
import 'package:tracking_app/core/utils/services/get_responsive_height_and_width.dart';
import 'package:tracking_app/core/utils/validator.dart';
import 'package:tracking_app/core/utils/widgets/custom_text_form_fieled.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/response/forget_password_response.dart';
import 'package:tracking_app/features/auth/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:tracking_app/features/auth/forget_password/presentation/widgets/app_bar_section.dart';

import '../../../../../generated/locale_keys.g.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ForgetPasswordCubit>();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
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
              key: cubit.formKey,

              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: responsiveWidth(15),
                      vertical: resposiveHeight(10),
                    ),
                    child: CustomTextFormFieled(
                      hintText: LocaleKeys.enterYourEmail.tr(),
                      labelText: LocaleKeys.email.tr(),
                      textEditingController:
                          context
                              .read<ForgetPasswordCubit>()
                              .forgetPasswordController,
                      isObsecureText: false,
                      validator: Validator.validateEmail,
                    ),
                  ),
                  responsiveHeightWidget(10),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: resposiveHeight(15),
                      vertical: responsiveWidth(10),
                    ),
                    child: BlocConsumer<
                      ForgetPasswordCubit,
                      ForgetPasswordState
                    >(
                      listenWhen:
                          (previous, current) =>
                              previous.forgetPasswordState !=
                              current.forgetPasswordState,
                      buildWhen:
                          (previous, current) =>
                              previous.forgetPasswordState !=
                              current.forgetPasswordState,
                      listener: (context, state) {
                        if (state.forgetPasswordState
                            is BaseSuccess<ForgetPasswordResponse>) {
                          showSnackBar(
                            context,
                            'Code is sent ,check your email!',
                          );

                          Navigator.pushNamed(
                            context,
                            RoutesName.verificationScreen,
                            arguments: {
                              "email":
                                  cubit.forgetPasswordController.text.trim(),
                            },
                          );
                        } else if (state.forgetPasswordState
                            is BaseError<ForgetPasswordResponse>) {
                          showErrorSnackBar(
                            context,
                            state.forgetPasswordResponse?.error ??
                                'email not found',
                          );
                        }
                      },
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: () {
                            if (cubit.formKey.currentState!.validate() == false) {
                              return;
                            }
                            cubit.forgetPassword();
                          },
                          child:
                              state.forgetPasswordState is BaseLoading
                                  ? const CircularProgressIndicator(
                                    color: PalletsColors.whiteBase,
                                  )
                                  : Text(
                                    LocaleKeys.confirm.tr(),
                                    style: AppTextStyles.instance.textStyle16
                                        .copyWith(color: PalletsColors.white10),
                                  ),
                        );
                      },
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
