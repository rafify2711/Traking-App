// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_logged_driver_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLoggedDriverDataResponse _$GetLoggedDriverDataResponseFromJson(
  Map<String, dynamic> json,
) => GetLoggedDriverDataResponse(
  message: json['message'] as String?,
  driver:
      json['driver'] == null
          ? null
          : DriverBean.fromJson(json['driver'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetLoggedDriverDataResponseToJson(
  GetLoggedDriverDataResponse instance,
) => <String, dynamic>{'message': instance.message, 'driver': instance.driver};

DriverBean _$DriverBeanFromJson(Map<String, dynamic> json) => DriverBean(
  id: json['_id'] as String?,
  country: json['country'] as String?,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  vehicleType: json['vehicleType'] as String?,
  vehicleNumber: json['vehicleNumber'] as String?,
  vehicleLicense: json['vehicleLicense'] as String?,
  NID: json['NID'] as String?,
  NIDImg: json['NIDImg'] as String?,
  email: json['email'] as String?,
  gender: json['gender'] as String?,
  phone: json['phone'] as String?,
  photo: json['photo'] as String?,
  role: json['role'] as String?,
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$DriverBeanToJson(DriverBean instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'country': instance.country,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'vehicleType': instance.vehicleType,
      'vehicleNumber': instance.vehicleNumber,
      'vehicleLicense': instance.vehicleLicense,
      'NID': instance.NID,
      'NIDImg': instance.NIDImg,
      'email': instance.email,
      'gender': instance.gender,
      'phone': instance.phone,
      'photo': instance.photo,
      'role': instance.role,
      'createdAt': instance.createdAt,
    };
