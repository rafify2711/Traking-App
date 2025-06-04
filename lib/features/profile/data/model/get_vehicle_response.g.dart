// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_vehicle_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetVehicleResponse _$GetVehicleResponseFromJson(Map<String, dynamic> json) =>
    GetVehicleResponse(
      message: json['message'] as String?,
      vehicle:
          json['vehicle'] == null
              ? null
              : VehicleBean.fromJson(json['vehicle'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetVehicleResponseToJson(GetVehicleResponse instance) =>
    <String, dynamic>{'message': instance.message, 'vehicle': instance.vehicle};

VehicleBean _$VehicleBeanFromJson(Map<String, dynamic> json) => VehicleBean(
  id: json['id'] as String?,
  type: json['type'] as String?,
  image: json['image'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  v: json['v'] as num?,
);

Map<String, dynamic> _$VehicleBeanToJson(VehicleBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'image': instance.image,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'v': instance.v,
    };
