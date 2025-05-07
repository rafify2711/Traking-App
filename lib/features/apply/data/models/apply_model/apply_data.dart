import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

class ApplyData {
  final String country;
  final String firstName;
  final String lastName;
  String? vehicleType;
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
    // Get mime types
    final vehicleMimeType = lookupMimeType(vehicleLicense.path);
    final idMimeType = lookupMimeType(idImage.path);

    if (vehicleMimeType == null || !vehicleMimeType.startsWith('image/')) {
      throw Exception('vehicleLicense must be an image file');
    }

    if (idMimeType == null || !idMimeType.startsWith('image/')) {
      throw Exception('NIDImg must be an image file');
    }

    // Extract type/subtype
    final vehicleMediaTypeParts = vehicleMimeType.split('/');
    final idMediaTypeParts = idMimeType.split('/');

    return FormData.fromMap({
      "country": country,
      "firstName": firstName,
      "lastName": lastName,
      "vehicleType": vehicleType,
      "vehicleNumber": vehicleNumber,
      "vehicleLicense": await MultipartFile.fromFile(
        vehicleLicense.path,
        contentType: MediaType(vehicleMediaTypeParts[0], vehicleMediaTypeParts[1]),
      ),
      "NIDImg": await MultipartFile.fromFile(
        idImage.path,
        contentType: MediaType(idMediaTypeParts[0], idMediaTypeParts[1]),
      ),
      "NID": idNumber,
      "email": email,
      "password": password,
      "rePassword": confirmPassword,
      "gender": gender,
      "phone": phoneNumber,
    });
  }
}
