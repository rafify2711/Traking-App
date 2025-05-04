// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _ar = {
  "local": "ar",
  "WelcomeToFloweryRiderApp": "مرحبًا بكم في تطبيق سائق فلويري",
  "forgetPassword": "نسيت كلمة المرور",
  "PleaseEnterYourEmailAssociatedToYourAccount": "يرجى إدخال بريدك الإلكتروني \nالمرتبط بحسابك",
  "email": "البريد الإلكتروني",
  "confirm": "تأكيد",
  "enterYourEmail": "أدخل بريدك الإلكتروني",
  "thisEmailIsNotValid": "هذا البريد الإلكتروني غير صالح",
  "password": "كلمة المرور",
  "emailVerification": "تحقق البريد الإلكتروني",
  "pleaseEnterYourCodeThatSendToYourEmailAddress": "يرجى ادخال الكود الذي تم ارساله لبريدك الإلكتروني",
  "didntReceiveTheCode": "لم تستلم الكود؟",
  "resend": "اعادة الارسال"
};
static const Map<String,dynamic> _en = {
  "local": "en",
  "WelcomeToFloweryRiderApp": "Welcome to Flowery rider app",
  "forgetPassword": "Forget password",
  "Please enter your email associatedto your account": "Please enter your email associated\n to your account",
  "email": "Email",
  "confirm": "Confirm",
  "enterYourEmail": "Enter your email",
  "thisEmailIsNotValid": "This email is not valid",
  "password": "Password",
  "emailVerification": "Email verification",
  "pleaseEnterYourCodeThatSendToYourEmailAddress": "Please Enter Your Code That Send To Your Email Address",
  "didntReceiveTheCode": "Didn't receive the code ?",
  "resend": "Resend"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar, "en": _en};
}
