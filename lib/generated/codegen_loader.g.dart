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
  "pleaseEnterYourEmailAssociatedToYourAccount": "يرجى ادخال بريدك الإلكتروني المرتبط \nبهذا الحساب",
  "email": "البريد الإلكتروني",
  "confirm": "تأكيد",
  "enterYourEmail": "أدخل بريدك الإلكتروني",
  "thisEmailIsNotValid": "هذا البريد الإلكتروني غير صالح",
  "password": "كلمة المرور",
  "emailVerification": "تحقق البريد الإلكتروني",
  "pleaseEnterYourCode": "يرجى ادخال الكود الذي تم ارساله\n لبريدك الإلكتروني",
  "didntReceiveTheCode": "لم تستلم الكود؟",
  "resend": "اعادة الارسال",
  "login": "تسجيل الدخول",
  "applyNow": "تقدم الان",
  "enterYourPassword": "ادخل كلمة المرور",
  "confirmPassword": "تأكيد كلمة المرور",
  "newPassword": "كلمة المرور الجديدة",
  "resetPassword": "إعادة تعيين كلمة المرور",
  "passwordMustBeValid": "يجب أن تكون كلمة المرور صحيحة",
  "passwordResetSuccess": "تم إعادة تعيين كلمة المرور بنجاح",
  "resetPasswordFailed": "فشل في إعادة تعيين كلمة المرور",
  "errorOccurred": "حدث خطأ ما",
  "loggedInSuccessfully": "تم تسجيل الدخول بنجاح",
  "remmemberMe": "تذكرني"
};
static const Map<String,dynamic> _en = {
  "local": "en",
  "applyNow": "Apply now",
  "WelcomeToFloweryRiderApp": "Welcome to Flowery rider app",
  "forgetPassword": "Forget password",
  "pleaseEnterYourEmailAssociatedToYourAccount": "Please enter your email associated to \n your account",
  "email": "Email",
  "confirm": "Confirm",
  "enterYourEmail": "Enter your email",
  "thisEmailIsNotValid": "This email is not valid",
  "password": "Password",
  "emailVerification": "Email verification",
  "pleaseEnterYourCode": "Please Enter Your Code That Send To Your\n Email Address",
  "didntReceiveTheCode": "Didn't receive the code ?",
  "resend": "Resend",
  "login": "Login",
  "enterYourPassword": "Enter your password",
  "confirmPassword": "Confirm password",
  "newPassword": "New password",
  "resetPassword": "Reset password",
  "passwordMustBeValid": "Password must be valid",
  "passwordResetSuccess": "Password reset successfully",
  "resetPasswordFailed": "Reset password failed",
  "errorOccurred": "An error occurred",
  "loggedInSuccessfully": "Logged in successfully",
  "remmemberMe": "Remember me"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar, "en": _en};
}
