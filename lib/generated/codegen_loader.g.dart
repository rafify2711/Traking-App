// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> _ar = {
    "local": "ar",
    "WelcomeToFloweryRiderApp": "مرحبًا بكم في تطبيق سائق فلويري",
    "forgetPassword": "نسيت كلمة المرور",
    "pleaseEnterYourEmailAssociatedToYourAccount":
        "يرجى ادخال بريدك الإلكتروني المرتبط \nبهذا الحساب",
    "email": "البريد الإلكتروني",
    "confirm": "تأكيد",
    "enterYourEmail": "أدخل بريدك الإلكتروني",
    "thisEmailIsNotValid": "هذا البريد الإلكتروني غير صالح",
    "password": "كلمة المرور",
    "emailVerification": "تحقق البريد الإلكتروني",
    "pleaseEnterYourCode":
        "يرجى ادخال الكود الذي تم ارساله\n لبريدك الإلكتروني",
    "didntReceiveTheCode": "لم تستلم الكود؟",
    "resend": "اعادة الارسال",
    "resetPassword": "إعادة تعيين كلمة المرور",
    "passwordMustBeValid":
        "يجب ألا تكون كلمة المرور فارغة ويجب أن تحتوي على 6 أحرف على الأقل مع حرف كبير ورقم واحد على الأقل.",
    "enterYourPassword": "أدخل كلمة المرور الخاصة بك",
    "newPassword": "كلمة المرور الجديدة",
    "confirmPassword": "تأكيد كلمة المرور",
    "passwordResetSuccess": "تمت إعادة تعيين كلمة المرور بنجاح!",
    "resetPasswordFailed": "فشل إعادة تعيين كلمة المرور",
    "errorOccurred": "حدث خطأ",
  };
  static const Map<String, dynamic> _en = {
    "local": "en",
    "WelcomeToFloweryRiderApp": "Welcome to Flowery rider app",
    "forgetPassword": "Forget password",
    "pleaseEnterYourEmailAssociatedToYourAccount":
        "Please enter your email associated to \n your account",
    "email": "Email",
    "confirm": "Confirm",
    "enterYourEmail": "Enter your email",
    "thisEmailIsNotValid": "This email is not valid",
    "password": "Password",
    "emailVerification": "Email verification",
    "pleaseEnterYourCode":
        "Please Enter Your Code That Send To Your\n Email Address",
    "didntReceiveTheCode": "Didn't receive the code ?",
    "resend": "Resend",
    "resetPassword": "Reset Password",
    "passwordMustBeValid":
        "Password must not be empty and must contain 6 characters with an uppercase letter and one number at least.",
    "enterYourPassword": "Enter Your Password",
    "newPassword": "New Password",
    "confirmPassword": "Confirm Password",
    "passwordResetSuccess": "Password reset successfully!",
    "resetPasswordFailed": "Reset password failed",
    "errorOccurred": "Error occurred",
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "ar": _ar,
    "en": _en,
  };
}
