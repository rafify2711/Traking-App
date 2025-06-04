import 'package:json_annotation/json_annotation.dart';

part 'get_logged_driver_data_response.g.dart';

@JsonSerializable()
class GetLoggedDriverDataResponse {
  String? message;
  DriverBean? driver;

  GetLoggedDriverDataResponse({this.message, this.driver});

  factory GetLoggedDriverDataResponse.fromJson(Map<String, dynamic> json) => _$GetLoggedDriverDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetLoggedDriverDataResponseToJson(this);
}

@JsonSerializable()

class DriverBean {
  @JsonKey(name: '_id')

  String ?id;
  String ?country;
  String ?firstName;
  String ?lastName;
  String ?vehicleType;
  String ?vehicleNumber;
  String ?vehicleLicense;
  String ?NID;
  String ?NIDImg;
  String ?email;
  String ?gender;
  String ?phone;
  String ?photo;
  String ?role;
  String ?createdAt;

  DriverBean({this.id, this.country, this.firstName, this.lastName, this.vehicleType, this.vehicleNumber, this.vehicleLicense, this.NID, this.NIDImg, this.email, this.gender, this.phone, this.photo, this.role, this.createdAt});

  factory DriverBean.fromJson(Map<String, dynamic> json) => _$DriverBeanFromJson(json);

  Map<String, dynamic> toJson() => _$DriverBeanToJson(this);
}

