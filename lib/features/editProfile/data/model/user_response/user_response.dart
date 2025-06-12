
import 'package:json_annotation/json_annotation.dart';
part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'driver')
  Driver? driver;

  UserResponse({this.message, this.driver});

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);

  static List<UserResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(UserResponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class Driver {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'country')
  String? country;
  @JsonKey(name: 'firstName')
  String? firstName;
  @JsonKey(name: 'lastName')
  String? lastName;
  @JsonKey(name: 'vehicleType')
  String? vehicleType;
  @JsonKey(name: 'vehicleNumber')
  String? vehicleNumber;
  @JsonKey(name: 'vehicleLicense')
  String? vehicleLicense;
  @JsonKey(name: 'NID')
  String? nid;
  @JsonKey(name: 'NIDImg')
  String? nidImg;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'password')
  String? password;
  @JsonKey(name: 'gender')
  String? gender;
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'photo')
  String? photo;
  @JsonKey(name: 'role')
  String? role;
  @JsonKey(name: 'createdAt')
  String? createdAt;
  @JsonKey(name: 'passwordResetCode')
  String? passwordResetCode;
  @JsonKey(name: 'passwordResetExpires')
  String? passwordResetExpires;
  @JsonKey(name: 'resetCodeVerified')
  bool? resetCodeVerified;
  @JsonKey(name: 'passwordChangedAt')
  String? passwordChangedAt;

  Driver({this.id, this.country, this.firstName, this.lastName, this.vehicleType, this.vehicleNumber, this.vehicleLicense, this.nid, this.nidImg, this.email, this.password, this.gender, this.phone, this.photo, this.role, this.createdAt, this.passwordResetCode, this.passwordResetExpires, this.resetCodeVerified, this.passwordChangedAt});

  factory Driver.fromJson(Map<String, dynamic> json) => _$DriverFromJson(json);

  static List<Driver> fromList(List<Map<String, dynamic>> list) {
    return list.map(Driver.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$DriverToJson(this);
}