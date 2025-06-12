// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
  message: json['message'] as String?,
  driver:
      json['driver'] == null
          ? null
          : Driver.fromJson(json['driver'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{'message': instance.message, 'driver': instance.driver};

Driver _$DriverFromJson(Map<String, dynamic> json) => Driver(
  id: json['_id'] as String?,
  country: json['country'] as String?,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  vehicleType: json['vehicleType'] as String?,
  vehicleNumber: json['vehicleNumber'] as String?,
  vehicleLicense: json['vehicleLicense'] as String?,
  nid: json['NID'] as String?,
  nidImg: json['NIDImg'] as String?,
  email: json['email'] as String?,
  password: json['password'] as String?,
  gender: json['gender'] as String?,
  phone: json['phone'] as String?,
  photo: json['photo'] as String?,
  role: json['role'] as String?,
  createdAt: json['createdAt'] as String?,
  passwordResetCode: json['passwordResetCode'] as String?,
  passwordResetExpires: json['passwordResetExpires'] as String?,
  resetCodeVerified: json['resetCodeVerified'] as bool?,
  passwordChangedAt: json['passwordChangedAt'] as String?,
);

Map<String, dynamic> _$DriverToJson(Driver instance) => <String, dynamic>{
  '_id': instance.id,
  'country': instance.country,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'vehicleType': instance.vehicleType,
  'vehicleNumber': instance.vehicleNumber,
  'vehicleLicense': instance.vehicleLicense,
  'NID': instance.nid,
  'NIDImg': instance.nidImg,
  'email': instance.email,
  'password': instance.password,
  'gender': instance.gender,
  'phone': instance.phone,
  'photo': instance.photo,
  'role': instance.role,
  'createdAt': instance.createdAt,
  'passwordResetCode': instance.passwordResetCode,
  'passwordResetExpires': instance.passwordResetExpires,
  'resetCodeVerified': instance.resetCodeVerified,
  'passwordChangedAt': instance.passwordChangedAt,
};
