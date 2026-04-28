import 'package:equatable/equatable.dart';

class Driver extends Equatable {
  final String? country;
  final String? firstName;
  final String? lastName;
  final String? vehicleType;
  final String? vehicleNumber;
  final String? vehicleLicense;
  final String? nid;
  final String? nidImg;
  final String? email;
  final String? gender;
  final String? phone;
  final String? photo;
  final String? role;
  final String? id;
  final DateTime? createdAt;
final  num? latitude;
final  num? longitude;

  const Driver({
    this.country,
    this.firstName,
    this.lastName,
    this.vehicleType,
    this.vehicleNumber,
    this.vehicleLicense,
    this.nid,
    this.nidImg,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.role,
    this.id,
    this.createdAt,
    this.latitude,
    this.longitude, 
  });

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
    country: json['country'] as String?,
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String?,
    vehicleType: json['vehicleType'] as String?,
    vehicleNumber: json['vehicleNumber'] as String?,
    vehicleLicense: json['vehicleLicense'] as String?,
    nid: json['NID'] as String?,
    nidImg: json['NIDImg'] as String?,
    email: json['email'] as String?,
    gender: json['gender'] as String?,
    phone: json['phone'] as String?,
    photo: json['photo'] as String?,
    role: json['role'] as String?,
    id: json['_id'] as String?,
    createdAt:
        json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
    latitude: json['DriverLatitude'] as num?,
    longitude: json['DriverLongitude'] as num?,
  );

  Map<String, dynamic> toJson() => {
    'country': country,
    'firstName': firstName,
    'lastName': lastName,
    'vehicleType': vehicleType,
    'vehicleNumber': vehicleNumber,
    'vehicleLicense': vehicleLicense,
    'NID': nid,
    'NIDImg': nidImg,
    'email': email,
    'gender': gender,
    'phone': phone,
    'photo': photo,
    'role': role,
    '_id': id,
    'createdAt': createdAt?.toIso8601String(),
    'DriverLatitude': latitude,
    'DriverLongitude': longitude,
  };

  @override
  List<Object?> get props {
    return [
      country,
      firstName,
      lastName,
      vehicleType,
      vehicleNumber,
      vehicleLicense,
      nid,
      nidImg,
      email,
      gender,
      phone,
      photo,
      role,
      id,
      createdAt,
      latitude,
      longitude,
    ];
  }
}
