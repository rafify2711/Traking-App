import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tracking_app/features/auth/forget_password/presentation/widgets/app_bar_section.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';
class VerificationBody extends StatelessWidget {
  const VerificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(50),
      child: AppBarSection(text: LocaleKeys.emailVerification.tr(),),),
      body: Column(children: [
        
      ]), 
      
    );
  }
}