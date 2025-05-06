import 'dart:io';

import 'package:dio/dio.dart';

class ApplyData {
  final String country;
  final String firstName;
  final String lastName;
  final String vehicleType;
  final String vehicleNumber;
  final File vehicleLicense;
  final String email;
  final String phoneNumber;
  final String idNumber;
  final File idImage;
  final String password;
  final String confirmPassword;
  final String gender;

  ApplyData({
    required this.country,
    required this.firstName,
    required this.lastName,
    required this.vehicleType,
    required this.vehicleNumber,
    required this.vehicleLicense,
    required this.email,
    required this.phoneNumber,
    required this.idNumber,
    required this.idImage,
    required this.password,
    required this.confirmPassword,
    required this.gender,
  });

  Future<FormData> toFormData() async {
    return FormData.fromMap({
      "country": country,
      "firstName": firstName,
      "lastName": lastName,
      "vehicleType": vehicleType,
      "vehicleNumber": vehicleNumber,
      "vehicleLicense": vehicleLicense,
      "NID": idNumber,
      "NIDImg": idImage,
      "email": email,
      "password": password,
      "rePassword": confirmPassword,
      "gender": gender,
      "phone": phoneNumber,
    });
  }
}
