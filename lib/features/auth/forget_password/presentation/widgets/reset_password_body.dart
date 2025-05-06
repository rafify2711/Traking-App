import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracking_app/core/base/base_state.dart';
import 'package:tracking_app/core/config/routes_name.dart';
import 'package:tracking_app/core/utils/app_text_styles.dart';
import 'package:tracking_app/core/utils/colors.dart';
import 'package:tracking_app/core/utils/helper_func/snack_bar.dart';
import 'package:tracking_app/core/utils/validator.dart';
import 'package:tracking_app/core/utils/widgets/custom_text_form_fieled.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/request/reset_password_request.dart';
import 'package:tracking_app/features/auth/forget_password/presentation/cubit/reset_password_cubit.dart';

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
              showSnackBar(context, 'Password reset successfully!');
              Navigator.pushNamed(context, RoutesName.forgetPassword);
            } else if (status is BaseError) {
              log("Reset password failed");
              showErrorSnackBar(context, "Error occurred");
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                SizedBox(height: 40),
                Text(
                  "Reset password",
                  style: AppTextStyles.instance.textStyle18.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Password must not be empty and must contain 6 characters with an uppercase letter and one number at least.",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.instance.textStyle14.copyWith(
                    color: PalletsColors.gray,
                  ),
                ),
                SizedBox(height: 32),
                CustomTextFormFieled(
                  hintText: "Enter Your Password",
                  labelText: "New Password",
                  isObsecureText: true,
                  textEditingController: newPasswordController,
                  validator: Validator.validatePassword,
                ),
                SizedBox(height: 24),
                CustomTextFormFieled(
                  textEditingController: confirmPasswordController,
                  labelText: "Confirm Password",
                  hintText: "Confirm Password",
                  isObsecureText: true,
                  validator:
                      (value) => Validator.validateConfirmPassword(
                        value,
                        newPasswordController.text.trim(),
                      ),
                ),
                SizedBox(height: 48),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<ResetPasswordCubit>().resetPassword(
                        ResetPasswordRequest(
                          email:
                              "omarsalah1776@gmail.com", // Replace with dynamic email if needed
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
                            "Confirm",
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
