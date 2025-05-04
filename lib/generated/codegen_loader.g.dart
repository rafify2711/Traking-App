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

  static const Map<String,dynamic> _en = {
  "local": "en",
  "WelcomeToFloweryRiderApp": "Welcome to Flowery rider app",
  "applicationSubmittedTitle": "Your application has been\nsubmitted!",
  "applicationSubmittedBody": "Thank you for providing your application, we will review your application and will get back to you soon.",
  "login": "Login"
};
static const Map<String,dynamic> _ar = {
  "local": "ar",
  "WelcomeToFloweryRiderApp": "مرحبًا بكم في تطبيق سائق فلويري",
  "applicationSubmittedTitle": "تم تقديم طلبك!",
  "applicationSubmittedBody": "شكرًا لتقديمك الطلب، سنقوم بمراجعته وسنعود إليك قريبًا.",
  "login": "تسجيل الدخول"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": _en, "ar": _ar};
}
