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
    "welcomeToFloweryRiderApp": "مرحبًا بك في تطبيق فلوراي رايدر",
    "country": "البلد",
    "firstLegalName": "الاسم القانوني الأول",
    "enterFirstLegalName": "أدخل الاسم القانوني الأول",
    "secondLegalName": "الاسم القانوني الثاني",
    "enterSecondLegalName": "أدخل الاسم القانوني الثاني",
    "vehicleType": "نوع المركبة",
    "vehicleNumber": "رقم المركبة",
    "enterVehicleNumber": "أدخل رقم المركبة",
    "vehicleLicense": "رخصة المركبة",
    "uploadLicensePhoto": "رفع صورة الرخصة",
    "email": "البريد الإلكتروني",
    "enterYourEmail": "أدخل بريدك الإلكتروني",
    "phoneNumber": "رقم الهاتف",
    "enterPhoneNumber": "أدخل رقم الهاتف",
    "idNumber": "رقم الهوية",
    "enterNationalIdNumber": "أدخل رقم الهوية الوطنية",
    "idImage": "صورة الهوية",
    "uploadIdImage": "رفع صورة الهوية",
    "password": "كلمة المرور",
    "enterPassword": "أدخل كلمة المرور",
    "confirmPassword": "تأكيد كلمة المرور",
    "gender": "الجنس",
    "female": "أنثى",
    "male": "ذكر",
  };
  static const Map<String, dynamic> _en = {
    "local": "en",
    "welcomeToFloweryRiderApp": "Welcome to Flowery rider app",
    "country": "Country",
    "firstLegalName": "First legal name",
    "enterFirstLegalName": "Enter first legal name",
    "secondLegalName": "Second legal name",
    "enterSecondLegalName": "Enter second legal name",
    "vehicleType": "Vehicle type",
    "vehicleNumber": "Vehicle number",
    "vehicleLicense": "Vehicle license",
    "enterVehicleNumber": "Enter vehicle number",
    "uploadLicensePhoto": "Upload license photo",
    "email": "Email",
    "enterYourEmail": "Enter your email",
    "phoneNumber": "Phone number",
    "enterPhoneNumber": "Enter phone number",
    "idNumber": "ID number",
    "enterNationalIdNumber": "Enter national ID number",
    "idImage": "ID image",
    "uploadIdImage": "Upload ID image",
    "password": "Password",
    "enterPassword": "Enter password",
    "confirmPassword": "Confirm password",
    "gender": "Gender",
    "female": "Female",
    "male": "Male",
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "ar": _ar,
    "en": _en,
  };
}
