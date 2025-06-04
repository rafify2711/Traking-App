import 'dart:convert';

import 'package:collection/collection.dart';

class Driver {
  String? id;
  String? country;
  String? firstName;
  String? lastName;
  String? vehicleType;
  String? vehicleNumber;
  String? vehicleLicense;
  String? nid;
  String? nidImg;
  String? email;
  String? password;
  String? gender;
  String? phone;
  String? photo;
  String? role;
  DateTime? createdAt;

  Driver({
    this.id,
    this.country,
    this.firstName,
    this.lastName,
    this.vehicleType,
    this.vehicleNumber,
    this.vehicleLicense,
    this.nid,
    this.nidImg,
    this.email,
    this.password,
    this.gender,
    this.phone,
    this.photo,
    this.role,
    this.createdAt,
  });

  @override
  String toString() {
    return 'Driver(id: $id, country: $country, firstName: $firstName, lastName: $lastName, vehicleType: $vehicleType, vehicleNumber: $vehicleNumber, vehicleLicense: $vehicleLicense, nid: $nid, nidImg: $nidImg, email: $email, password: $password, gender: $gender, phone: $phone, photo: $photo, role: $role, createdAt: $createdAt)';
  }

  factory Driver.fromMap(Map<String, dynamic> data) => Driver(
    id: data['_id'] as String?,
    country: data['country'] as String?,
    firstName: data['firstName'] as String?,
    lastName: data['lastName'] as String?,
    vehicleType: data['vehicleType'] as String?,
    vehicleNumber: data['vehicleNumber'] as String?,
    vehicleLicense: data['vehicleLicense'] as String?,
    nid: data['NID'] as String?,
    nidImg: data['NIDImg'] as String?,
    email: data['email'] as String?,
    password: data['password'] as String?,
    gender: data['gender'] as String?,
    phone: data['phone'] as String?,
    photo: data['photo'] as String?,
    role: data['role'] as String?,
    createdAt:
        data['createdAt'] == null
            ? null
            : DateTime.parse(data['createdAt'] as String),
  );

  Map<String, dynamic> toMap() => {
    '_id': id,
    'country': country,
    'firstName': firstName,
    'lastName': lastName,
    'vehicleType': vehicleType,
    'vehicleNumber': vehicleNumber,
    'vehicleLicense': vehicleLicense,
    'NID': nid,
    'NIDImg': nidImg,
    'email': email,
    'password': password,
    'gender': gender,
    'phone': phone,
    'photo': photo,
    'role': role,
    'createdAt': createdAt?.toIso8601String(),
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Driver].
  factory Driver.fromJson(String data) {
    return Driver.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Driver] to a JSON string.
  String toJson() => json.encode(toMap());

  Driver copyWith({
    String? id,
    String? country,
    String? firstName,
    String? lastName,
    String? vehicleType,
    String? vehicleNumber,
    String? vehicleLicense,
    String? nid,
    String? nidImg,
    String? email,
    String? password,
    String? gender,
    String? phone,
    String? photo,
    String? role,
    DateTime? createdAt,
  }) {
    return Driver(
      id: id ?? this.id,
      country: country ?? this.country,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      vehicleType: vehicleType ?? this.vehicleType,
      vehicleNumber: vehicleNumber ?? this.vehicleNumber,
      vehicleLicense: vehicleLicense ?? this.vehicleLicense,
      nid: nid ?? this.nid,
      nidImg: nidImg ?? this.nidImg,
      email: email ?? this.email,
      password: password ?? this.password,
      gender: gender ?? this.gender,
      phone: phone ?? this.phone,
      photo: photo ?? this.photo,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Driver) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      country.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      vehicleType.hashCode ^
      vehicleNumber.hashCode ^
      vehicleLicense.hashCode ^
      nid.hashCode ^
      nidImg.hashCode ^
      email.hashCode ^
      password.hashCode ^
      gender.hashCode ^
      phone.hashCode ^
      photo.hashCode ^
      role.hashCode ^
      createdAt.hashCode;
}
