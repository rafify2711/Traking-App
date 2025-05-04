import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:tracking_app/core/config/routes_name.dart';

import 'package:tracking_app/core/utils/app_text_styles.dart';
import 'package:tracking_app/core/utils/colors.dart';
import 'package:tracking_app/core/utils/services/get_responsive_height_and_width.dart';
import 'package:tracking_app/core/utils/validator.dart';
import 'package:tracking_app/core/utils/widgets/custom_text_form_fieled.dart';
import 'package:tracking_app/features/auth/forget_password/presentation/widgets/app_bar_section.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';
class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(50),child: AppBarSection(text: LocaleKeys.password.tr(),),) ,
      body: Center(
        child: Column(
          children: [
            Text(LocaleKeys.forgetPassword.tr(), style: AppTextStyles.instance.textStyle18
                .copyWith(fontWeight: FontWeight.w600)),
             responsiveHeightWidget(10),
            Text(LocaleKeys.PleaseEnterYourEmailAssociatedToYourAccount.tr(), 
                style: AppTextStyles.instance.textStyle14.copyWith(
                  color: PalletsColors.gray,  
                )),
                   responsiveHeightWidget(20),
                Padding(
                  padding:  EdgeInsets.symmetric(
                    horizontal: resposiveHeight(15),
                    vertical: resposiveWidth(10),
                  ),
                  child: CustomTextFormFieled(
                    hintText: LocaleKeys.enterYourEmail.tr(),
                    labelText: LocaleKeys.email.tr(),
                    textEditingController: TextEditingController(),
                    isObsecureText: false,
                    validator: Validator.validateEmail,
                  ),
                ),
                responsiveHeightWidget(10),
                Padding(
                  padding:  EdgeInsets.symmetric(
                    horizontal: resposiveHeight(15),
                    vertical: resposiveWidth(10),
                  ),
                  child: ElevatedButton(onPressed: (){
                    Navigator.pushNamed(context, RoutesName.verificationScreen);
                  },
                   child: Text(LocaleKeys.confirm.tr(),
                   style: AppTextStyles.instance.textStyle16.
                   copyWith(color: PalletsColors.white10),),),
                )
          ],
        ),
      ),
    );
  }
}