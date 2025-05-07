import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/base/base_state.dart';
import 'package:tracking_app/core/config/routes_name.dart';
import 'package:tracking_app/core/utils/app_text_styles.dart';
import 'package:tracking_app/core/utils/colors.dart';
import 'package:tracking_app/core/utils/helper_func/snack_bar.dart';
import 'package:tracking_app/core/utils/services/get_responsive_height_and_width.dart';
import 'package:tracking_app/core/utils/validator.dart';
import 'package:tracking_app/core/utils/widgets/custom_text_form_fieled.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/request/reset_password_request.dart';
import 'package:tracking_app/features/auth/forget_password/presentation/cubit/reset_password_cubit.dart';
import 'package:tracking_app/generated/codegen_loader.g.dart'; // Make sure this is the correct path
import 'package:tracking_app/generated/locale_keys.g.dart'; // Add this import

class ResetPasswordBody extends StatelessWidget {
  const ResetPasswordBody({
    super.key,
    required this.formKey,
    required this.newPasswordController,
    required this.confirmPasswordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController newPasswordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: formKey,
        child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
          listenWhen:
              (previous, current) =>
                  previous.resetPasswordState != current.resetPasswordState,
          buildWhen:
              (previous, current) =>
                  previous.resetPasswordState != current.resetPasswordState,
          listener: (context, state) {
            final status = state.resetPasswordState;

            if (status is BaseSuccess) {
              showSnackBar(context, LocaleKeys.passwordResetSuccess.tr());
              Navigator.pushNamed(context, RoutesName.forgetPassword);
            } else if (status is BaseError) {
              log(LocaleKeys.resetPasswordFailed.tr());
              showErrorSnackBar(context, LocaleKeys.errorOccurred.tr());
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                responsiveHeightWidget(40),
                Text(
                  LocaleKeys.resetPassword.tr(),
                  style: AppTextStyles.instance.textStyle18.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                responsiveHeightWidget(16),
                Text(
                  LocaleKeys.passwordMustBeValid.tr(),
                  textAlign: TextAlign.center,
                  style: AppTextStyles.instance.textStyle14.copyWith(
                    color: PalletsColors.gray,
                  ),
                ),
                responsiveHeightWidget(32),
                CustomTextFormFieled(
                  hintText: LocaleKeys.enterYourPassword.tr(),
                  labelText: LocaleKeys.newPassword.tr(),
                  isObsecureText: true,
                  textEditingController: newPasswordController,
                  validator: Validator.validatePassword,
                ),
                responsiveHeightWidget(24),
                CustomTextFormFieled(
                  textEditingController: confirmPasswordController,
                  labelText: LocaleKeys.confirmPassword.tr(),
                  hintText: LocaleKeys.confirmPassword.tr(),
                  isObsecureText: true,
                  validator:
                      (value) => Validator.validateConfirmPassword(
                        value,
                        newPasswordController.text.trim(),
                      ),
                ),
                responsiveHeightWidget(48),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<ResetPasswordCubit>().resetPassword(
                        ResetPasswordRequest(
                          email: "omarsalah1776@gmail.com",
                          newPassword: newPasswordController.text.trim(),
                        ),
                      );
                    }
                  },
                  child:
                      state.resetPasswordState is BaseLoading
                          ? CircularProgressIndicator(
                            color: PalletsColors.whiteBase,
                          )
                          : Text(
                            LocaleKeys.confirm.tr(),
                            style: AppTextStyles.instance.textStyle16.copyWith(
                              color: PalletsColors.white10,
                            ),
                          ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
