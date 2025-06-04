import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracking_app/core/utils/colors.dart';
import 'package:tracking_app/core/utils/services/get_responsive_height_and_width.dart';
import 'package:tracking_app/core/utils/validator.dart';
import 'package:tracking_app/core/utils/widgets/custom_text_form_fieled.dart';

import 'package:tracking_app/generated/locale_keys.g.dart';

class ChangePasswordScreenBody extends StatefulWidget {
  const ChangePasswordScreenBody({super.key});

  @override
  State<ChangePasswordScreenBody> createState() =>
      _ChangePasswordScreenBodyState();
}

class _ChangePasswordScreenBodyState extends State<ChangePasswordScreenBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
 late  TextEditingController oldPassWord ;
  late TextEditingController newPassWord;
 late  TextEditingController confirmPassword;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  void initState() {
    oldPassWord = TextEditingController();
    newPassWord = TextEditingController();
    confirmPassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    oldPassWord.dispose();
    newPassWord.dispose();
    confirmPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsiveWidth(16)),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            responsiveHeightWidget(32),
            CustomTextFormFieled(
              textEditingController: oldPassWord,
              labelText: LocaleKeys.currentPassword.tr(),
              hintText: LocaleKeys.currentPassword.tr(),
              isObsecureText: true,
            ),
            responsiveHeightWidget(24),
            CustomTextFormFieled(
              textEditingController: newPassWord,
              labelText: LocaleKeys.newPassword.tr(),
              hintText: LocaleKeys.newPassword.tr(),
              isObsecureText: true,
              validator: (value) => Validator.validatePassword(value),
            ),
           responsiveHeightWidget(24),
            CustomTextFormFieled(
              textEditingController: confirmPassword,
              labelText: LocaleKeys.confirmPassword.tr(),
              hintText: LocaleKeys.confirmPassword.tr(),
              isObsecureText: true,
              validator:
                  (value) => Validator.validateConfirmPassword(
                    value,
                    newPassWord.text.trim(),
                  ),
            ),
            responsiveHeightWidget(48),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  // triggerChangePasswordCubit(context);
                  autovalidateMode = AutovalidateMode.disabled;
                  setState(() {});
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: PalletsColors.black30,
              ),
              child:  const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }

//   void triggerChangePasswordCubit(BuildContext context) {
//     context.read<ChangePasswordCubit>().changePassword(
//       oldPassword: oldPassWord.text.trim(),
//       newPassword: newPassWord.text.trim(),
//     );
//   }
 }
