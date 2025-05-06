import 'package:easy_localization/easy_localization.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

class Validator {
  static String? validateEmail(String? val) {
    final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (val == null || val.trim().isEmpty) {
      return LocaleKeys.validationEmailEmpty.tr();
    } else if (!emailRegex.hasMatch(val)) {
      return LocaleKeys.validationEmailInvalid.tr();
    } else {
      return null;
    }
  }

  static String? validateName(String? val) {
    if (val == null || val.isEmpty) {
      return LocaleKeys.validationRequiredField.tr();
    } else {
      return null;
    }
  }

  static String? emptyValidation(String? val) {
    if (val == null || val.isEmpty) {
      return LocaleKeys.validationRequiredField.tr();
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String? val) {
    if (val == null || val.isEmpty) {
      return LocaleKeys.validationRequiredField.tr();
    } else if (int.tryParse(val.trim()) == null) {
      return LocaleKeys.validationNumbersOnly.tr();
    } else {
      return null;
    }
  }

  static String? validatePassword(String? val) {
    final RegExp passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*[0-9]).{8,}$');
    if (val == null || val.isEmpty) {
      return LocaleKeys.validationRequiredField.tr();
    } else if (!passwordRegex.hasMatch(val)) {
      return LocaleKeys.validationPasswordInvalid.tr();
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? val, String? password) {
    if (val == null || val.isEmpty) {
      return LocaleKeys.validationRequiredField.tr();
    } else if (val != password) {
      return LocaleKeys.validationPasswordMismatch.tr();
    } else {
      return null;
    }
  }

  static String? validateVehicleNumber(String? val) {
    final RegExp vehicleRegex = RegExp(r'^[A-Z]{3}-\d{3}$');
    if (val == null || val.trim().isEmpty) {
      return LocaleKeys.validationRequiredField.tr();
    } else if (!vehicleRegex.hasMatch(val.trim().toUpperCase())) {
      return LocaleKeys.validationVehicleNumberInvalid.tr();
    } else {
      return null;
    }
  }

  static String? validateIdNumber(String? val) {
    if (val == null || val.length != 14) {
      return LocaleKeys.validationIdNumberInvalid.tr();
    } else {
      return null;
    }
  }
}
