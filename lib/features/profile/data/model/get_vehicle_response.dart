import 'package:json_annotation/json_annotation.dart';

part 'get_vehicle_response.g.dart';

@JsonSerializable()
class GetVehicleResponse {
  String? message;
  VehicleBean? vehicle;

  GetVehicleResponse({this.message, this.vehicle});

  factory GetVehicleResponse.fromJson(Map<String, dynamic> json) => _$GetVehicleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetVehicleResponseToJson(this);
}

@JsonSerializable()
class VehicleBean {

  String ?id;
  String ?type;
  String ?image;
  String ?createdAt;
  String ?updatedAt;
  num ?v;

  VehicleBean({this.id, this.type, this.image, this.createdAt, this.updatedAt, this.v});

  factory VehicleBean.fromJson(Map<String, dynamic> json) => _$VehicleBeanFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleBeanToJson(this);
}

